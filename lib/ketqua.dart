import 'package:doan_android/bocauhoi_provider.dart';
import 'package:doan_android/choingay.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:doan_android/trangchu.dart';
import 'package:doan_android/xemlaicauhoi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ketQua_Screen extends StatefulWidget {
  UserObject user;
  ketQua_Screen({Key? key, required this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return KetQuaState();
  }
}

class KetQuaState extends State<ketQua_Screen> {
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsUsers = [];
  List<KetQuaChoiObject> lsKQ = [];
  String maUid = "";

  void loadKetQuaChoi() async {
    final users = await BoCauHoiProvider.danhSachNguoiDung();
    setState(() {});
    lsUsers = users;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadKetQuaChoi();
    layThongTinUser();
    layKetQuaChoi();
  }

  void layThongTinUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        maUid = user.uid;
      }
    });
  }

  void layKetQuaChoi() {
    ref
        .child("KetQuaChoi")
        .child("${widget.user.uid}")
        .limitToLast(1)
        .onChildAdded
        .listen((data) {
      KetQuaChoiObject ketQuaChoiObject =
          KetQuaChoiObject.fromJson(data.snapshot.value as Map);
      lsKQ.add(ketQuaChoiObject);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget noiDung = Column(
      children: [
        Padding(padding: EdgeInsets.all(20)),
        Container(
          width: 400,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.blue,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(top: 80, left: 130)),
                  Text(
                    'KẾT QUẢ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Tên: ${lsKQ.length == 0 ? "Đang lấy dự liệu..." : lsKQ[0].ten}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Độ khó: ${lsKQ.length == 0 ? "Đang lấy dự liệu..." : lsKQ[0].doKho}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Lĩnh vực: ${lsKQ.length == 0 ? "Đang lấy dự liệu..." : lsKQ[0].linhVuc}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Điểm: ${lsKQ.length == 0 ? "Đang lấy dự liệu..." : lsKQ[0].diem}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Thời gian: ${lsKQ.length == 0 ? "Đang lấy dự liệu..." : lsKQ[0].thoiGian}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Column(
                    children: [
                      Text(
                        'Số đáp án đúng: ${lsKQ.length == 0 ? "..." : lsKQ[0].soDapAnDung}/10',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 120)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => XemLaiCauHoi(),
                            ),
                          );
                        },
                        child: Text(
                          'Xem lại',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
    Widget button = Container(
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 20, top: 150)),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChoiNgay()));
                },
                child: Text(
                  'Tiếp tục',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 70),
                  side: BorderSide(),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 35, top: 150)),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TrangChu()));
                },
                child: Text(
                  'Trang chủ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 70),
                  side: BorderSide(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          noiDung,
          button,
        ],
      ),
    );
  }
}
