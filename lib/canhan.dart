import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_android/chinhsuahoso.dart';
import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:doan_android/trangchu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class caNhan_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return caNhan_ScreenState();
  }
}

class caNhan_ScreenState extends State<caNhan_Screen> {
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsNguoiDung = [];
  List<LichSuObject> lsLichSu = [];
  List<LichSuObject> lsLuotChoi = [];
  LichSuObject? lsDiem;
  String uidUser = "";
  bool kiemTra = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    retrieveUsersData();
    // layDuLieuLichSu();
    LayLuotChoi();
    LayDiemCaoNhat();
    lsDiem;
    if (mounted) {
      setState(() {});
    }
    // kiemTraUserVaHienThi();
  }

  void LayLuotChoi() {
    final RefLuotChoi = FirebaseDatabase.instance.ref("LichSuChoi");
    RefLuotChoi.onChildAdded.listen((event) {
      if (event.snapshot.child("Uid").value == uidUser) {
        LichSuObject lichSuObject =
            LichSuObject.fromJson(event.snapshot.value as Map);
        lsLuotChoi.add(lichSuObject);
      }
      setState(() {});
    });
  }

  void LayDiemCaoNhat() {
    final RefDiem =
        FirebaseDatabase.instance.ref("LichSuChoi").orderByChild("Diem");
    RefDiem.onChildAdded.listen((event) {
      if (event.snapshot.child("Uid").value == uidUser) {
        LichSuObject lichSuObject =
            LichSuObject.fromJson(event.snapshot.value as Map);
        lsDiem = lichSuObject;
      }
      setState(() {});
    });
  }

  _layTen() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return '${lsNguoiDung[i].FullName}';
      }
    }
    return 'Không có';
  }

  _layEmail() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return '${lsNguoiDung[i].Email}';
      }
    }
    return 'Không có';
  }

  _layGioiTinh() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return '${lsNguoiDung[i].Sex}';
      }
    }
    return 'Không có';
  }

  _laySDT() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return '${lsNguoiDung[i].Phone}';
      }
    }
    return 'Không có';
  }

  _layTuoi() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return '${lsNguoiDung[i].Age}';
      }
    }
    return 'Không có';
  }

  void retrieveUsersData() {
    ref.child("Users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.formJson(data.snapshot.value as Map);
      lsNguoiDung.add(userObject);
      setState(() {});
    });
  }

  void layDuLieuLichSu() {
    ref.child("LichSuChoi").onChildAdded.listen((data) {
      LichSuObject lichSuObject =
          LichSuObject.fromJson(data.snapshot.value as Map);
      lsLichSu.add(lichSuObject);
      setState(() {});
    });
  }

  _layLuotChoi() {
    for (int i = 0; i < lsLichSu.length; i++) {
      if (lsLichSu[i].uid == uidUser) {
        return lsLichSu[i];
      }
    }
    return 'Không có';
  }

  // void viethaminnetroi() {
  //   print(lsNguoiDung.length);
  // } hong thich

  // void kiemTraUserVaHienThi() {
  //   UserObject userObject;
  //   late UserObject users;
  //   ref.child("Users").onChildAdded.listen((data) {
  //     for (int i = 0; i < lsNguoiDung.length; i++) {
  //       if (uidUser == lsNguoiDung[i].uid) {
  //         userObject = UserObject.formJson(data.snapshot.value as Map);
  //       }
  //     }
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget thongTin = Container(
      width: 130,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(
            width: 2,
          )),
      child: Column(
        children: [
          Text(
            'Lượt chơi: ${lsLuotChoi.length}',
            // 'Lượt chơi:',
            style: TextStyle(fontSize: 18),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Text(
            'Điểm: ${lsDiem == null ? '0' : lsDiem?.diem}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
    Widget avartar = const CircleAvatar(
      radius: 95,
      backgroundColor: Color(0xffFDCF09),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 124, 117, 117),
        radius: 90,
        backgroundImage: AssetImage('images/hacker.png'),
      ),
    );
    Widget content = Container(
      padding: EdgeInsets.all(45),
      // child: StreamBuilder(
      //     stream: _users.where('email', isEqualTo: _authMail).snapshots(),
      //     builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasData) {
      //         return Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: snapshot.data!.docs.map((_users) {
      //               return Column(
      //                 children: [
      //                   Text(
      //                     _users['FullName'],
      //                     style: TextStyle(
      //                         fontSize: 20, fontWeight: FontWeight.bold),
      //                   ),
      //                 ],
      //               );
      //             }).toList());
      //       }

      //     })));

      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.perm_contact_calendar_sharp),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text(
                    'Tên: ' + _layTen(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.email),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('Email: ' + _layEmail(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Column(
          //       children: [
          //         Icon(Icons.lock),
          //       ],
          //     ),
          //     Padding(padding: EdgeInsets.only(left: 20)),
          //     Column(
          //       children: [
          //         Visibility(
          //             visible: true,
          //             child: Text(
          //                 'Mật khẩu: ${kiemTra ? _layMatKhau() : '********'}',
          //                 style: TextStyle(
          //                     fontSize: 20, fontWeight: FontWeight.bold)))
          //       ],
          //     ),
          // Padding(padding: EdgeInsets.only(left: 20)),
          // Column(
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         if (kiemTra == false) {
          //           setState(() {
          //             kiemTra = true;
          //           });
          //         } else {
          //           setState(() {
          //             kiemTra = false;
          //           });
          //         }
          //       },
          //       icon: kiemTra
          //           ? Icon(Icons.visibility)
          //           : Icon(Icons.visibility_off),
          //     ),
          //   ],
          // ),
          // Column(
          //   children: [
          //     Icon(Icons.wifi_protected_setup),
          //   ],
          // ),
          //   ],
          // ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.phone_android),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('Số điện thoại: ' + _laySDT(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.male),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('Giới tính: ' + _layGioiTinh(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.tag_faces),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('Tuổi: ' + _layTuoi(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ],
      ),
    );

    Widget bottomButton = Container(
      padding: EdgeInsets.only(left: 120, top: 10),
      child: Row(children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chinhSuaHoSo(),
                  ),
                );
                if (mounted) {
                  setState(() {});
                }
              },
              child: Text(
                'Chỉnh sửa hồ sơ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
            )
          ],
        ),
      ]),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 60)),
              avartar,
              Padding(padding: EdgeInsets.only(left: 35)),
              thongTin,
            ],
          ),
          content,
          bottomButton,
        ],
      ),
    );
  }
}
