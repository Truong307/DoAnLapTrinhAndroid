import 'package:doan_android/dang_nhap.dart';
import 'package:flutter/material.dart';

class chinhSuaHoSo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(right: 350, top: 30),
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
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Nguyễn Đan Trường',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 300, top: 30),
            child: const Text(
              "Password",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: const TextField(
              decoration: InputDecoration(
                hintText: '*******',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 270, top: 30),
            child: const Text(
              "Số điện thoại",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: const TextField(
              decoration: InputDecoration(
                hintText: '0306201396',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ]));
    Widget bottomButton = Container(
      padding: EdgeInsets.only(left: 20, top: 40),
      child: Row(children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
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
        Padding(
          padding: EdgeInsets.only(right: 20),
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
      body: Container(
        child: Column(children: [avartar, content, bottomButton]),
      ),
    );
  }
}
