import 'package:doan_android/banbe.dart';
import 'package:doan_android/bangxephang.dart';
import 'package:doan_android/canhan.dart';
import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/lichsuchoicanhan.dart';
import 'package:doan_android/nutchoingay.dart';
import 'package:doan_android/thongbao.dart';
import 'package:doan_android/tintuc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrangChu extends StatefulWidget {
  @override
  State<TrangChu> createState() => TrangChu_State();
}

class TrangChu_State extends State<TrangChu> {
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
              child: Image.asset("images/user1.png"),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'truong307',
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
                        builder: (context) => LichSuChoiCaNhan()));
              },
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.exit_to_app),
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
