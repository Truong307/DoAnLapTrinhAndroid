import 'dart:ui';
import 'package:doan_android/banbe.dart';
import 'package:doan_android/bangxephang.dart';
import 'package:doan_android/bocauhoi_provider.dart';
import 'package:doan_android/canhan.dart';
import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/lichsuchoicanhan.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:doan_android/nutchoingay.dart';
import 'package:doan_android/thongbao.dart';
import 'package:doan_android/tintuc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TrangChu extends StatefulWidget {
  @override
  State<TrangChu> createState() => TrangChu_State();
}

class TrangChu_State extends State<TrangChu> {
  final ref = FirebaseDatabase.instance.ref();
  List<KetQuaChoiObject> lsKQChoi = [];
  List<UserObject> lsNguoiDung = [];
  String uidUser = '';

  void loadDanhSach() async {
    final user = await BoCauHoiProvider.layAllKetQuaChoi();
    setState(() {});
    lsKQChoi = user;
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    loadDanhSach();
    retrieveUsersData();
  }

  hienThongTinUser() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return lsNguoiDung[i];
      }
    }
    return null;
  }

  _layTen() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return '${lsNguoiDung[i].FullName}';
      }
    }
    return 'Đang lấy dữ liệu';
  }

  void retrieveUsersData() {
    ref.child("Users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.formJson(data.snapshot.value as Map);
      lsNguoiDung.add(userObject);
      setState(() {});
    });
  }

  int _selectedIndex = 2;

  void OntabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> lsSreen = [
    bangXepHangStateLess(),
    TinTuc_App(),
    playButton(),
    banBe_Screen(),
    caNhan_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
//===================================================//
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset("images/hacker.png"),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  _layTen(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            IconButton(
              splashRadius: 24,
              tooltip: 'Thông báo',
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.grey,
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThongBao_App(),
                  ),
                );
              }, // Chưa xử lý
            ),
            IconButton(
              splashRadius: 24,
              tooltip: 'Thông báo',
              //icon: Image.asset("images/bell.png"),
              icon: const Icon(
                Icons.history,
                color: Colors.grey,
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LichChoiCaNhan(
                      user: hienThongTinUser(),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text('Đăng xuất !!!'),
                        content: Text('Bạn có muốn thoát ? '),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text('Không'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();

                              FirebaseAuth.instance.signOut();

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            child: Text('Có'),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.logout),
              color: Colors.grey,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: OntabSelected,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.signal_cellular_alt_outlined,
                size: 40,
              ),
              label: 'Xếp Hạng',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper_outlined,
                size: 40,
              ),
              label: 'Tin Tức',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 60,
              ),
              label: 'Trang Chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_outline,
                size: 40,
              ),
              label: 'Bạn Bè',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 40,
              ),
              label: 'Hồ Sơ',
            ),
          ],
        ),
      ),
      body: lsSreen[_selectedIndex],
    );
  }
}
