import 'package:doan_android/choingay.dart';
import 'package:doan_android/ket_qua_thach_dau.dart';
import 'package:doan_android/lichsuchoicanhan.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:doan_android/trangchu.dart';
import 'package:doan_android/xemlaicauhoi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class chiTietLichSu extends StatefulWidget {
  KetQuaChoiObject? kq;

  chiTietLichSu({Key? key, this.kq}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return chiTietLichSuState();
  }
}

class chiTietLichSuState extends State<chiTietLichSu> {
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsNguoiDung = [];
  String uidUser = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    retrieveUsersData();
  }

  hienThongTinUser() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return lsNguoiDung[i];
      }
    }
  }

  void retrieveUsersData() {
    ref.child("Users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.formJson(data.snapshot.value as Map);
      lsNguoiDung.add(userObject);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget backButton = Container(
      child: Row(
        children: [
          Container(
            child: IconButton(
              splashRadius: 24,
              tooltip: 'Trở về',
              //Xử trở về trang chủ
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LichChoiCaNhan(
                              user: hienThongTinUser(),
                            )));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
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
                    widget.kq == null
                        ? 'Tên: Nguyễn Văn A'
                        : 'Tên: ${widget.kq?.ten}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    widget.kq == null
                        ? 'Độ khó: Trung bình'
                        : 'Độ khó: ${widget.kq?.doKho}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    widget.kq == null
                        ? 'Lĩnh vực: Lịch sử'
                        : 'Lĩnh vực: ${widget.kq?.linhVuc}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    widget.kq == null
                        ? 'Điểm: 260'
                        : 'Điểm: ${widget.kq?.diem}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    widget.kq == null
                        ? 'Thời gian: 21:09 - 22/10/2022'
                        : 'Thời gian: ${widget.kq?.thoiGian}',
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
                        widget.kq == null
                            ? 'Số đáp án đúng: 26/30'
                            : 'Số đáp án đúng: ${widget.kq?.soDapAnDung}/10',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 130)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => XemLaiCauHoi()));
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kết quả',
      home: Scaffold(
        body: Column(
          children: [
            backButton,
            noiDung,
          ],
        ),
      ),
    );
  }
}
