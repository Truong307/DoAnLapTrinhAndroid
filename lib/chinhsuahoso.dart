import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_android/canhan.dart';
import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:doan_android/trangchu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class chinhSuaHoSo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return chinhSuaHoSoState();
  }
}

class chinhSuaHoSoState extends State<chinhSuaHoSo> {
  var fullName = TextEditingController();
  var phone = TextEditingController();
  var sex = TextEditingController();
  var age = TextEditingController();

  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsNguoiDung = [];
  String uidUser = '';

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    retrieveUsersData();
    if (mounted) {
      setState(() {});
    }
  }

  _layTen() {
    for (int i = 0; i < lsNguoiDung.length; i++) {
      if (lsNguoiDung[i].uid == uidUser) {
        return '${lsNguoiDung[i].FullName}';
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrangChu()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
          Padding(padding: EdgeInsets.all(35)),
          Column(
            children: [
              Container(
                child: Text(
                  'Chỉnh sửa hồ sơ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
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
      padding: EdgeInsets.all(20),
      // child: StreamBuilder(
      //     stream: _users.where('email', isEqualTo: _authMail).snapshots(),
      //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasData) {
      //         return Column(
      //             children: snapshot.data!.docs.map((_users) {
      //           return TextField(
      //             controller: _name,
      //             decoration: InputDecoration(
      //               hintText: _name.text = _users['FullName'],
      //               border: OutlineInputBorder(),
      //               prefixIcon: Icon(Icons.person),
      //             ),
      //           );
      //         }).toList());
      //       }
      //     })

      child: Column(children: [
        Container(
          padding: EdgeInsets.only(right: 340, top: 30),
          child: const Text(
            "Tên",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: TextField(
            controller: fullName,
            decoration: InputDecoration(
              hintText: fullName.text = _layTen(),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 290, top: 10),
          child: const Text(
            "Điện thoại",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: TextField(
            controller: phone,
            decoration: InputDecoration(
              hintText: phone.text = _laySDT(),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone_android),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 300, top: 10),
          child: const Text(
            "Giới tính",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: TextField(
            controller: sex,
            decoration: InputDecoration(
              hintText: sex.text = _layGioiTinh(),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.male),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 330, top: 10),
          child: const Text(
            "Tuổi",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: TextField(
            controller: age,
            decoration: InputDecoration(
              hintText: age.text = _layTuoi(),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.tag_faces),
            ),
          ),
        ),
      ]),
    );
    Widget bottomButton = Container(
      padding: EdgeInsets.only(left: 140, top: 40),
      child: Row(children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                if (fullName.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Tên không được bỏ trống');
                  return;
                }
                User? user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  DatabaseReference ref = FirebaseDatabase.instance
                      .ref()
                      .child('Users')
                      .child(user.uid);

                  await ref.update({
                    'FullName': fullName.text,
                    'Phone': phone.text,
                    'Sex': sex.text,
                    'Age': age.text,
                  });

                  if (mounted) {
                    setState(() {});
                  }
                }
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrangChu(),
                  ),
                );
              },
              child: Text(
                'Lưu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(170, 50),
              ),
            )
          ],
        ),
      ]),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            backButton,
          ],
        ),
        backgroundColor: Color.fromARGB(250, 250, 250, 250),
      ),
      body: Column(
        children: [
          avartar,
          content,
          bottomButton,
        ],
      ),
    );
  }
}
