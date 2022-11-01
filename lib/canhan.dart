import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

class caNhan_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget backButton = Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: IconButton(
              splashRadius: 24,
              tooltip: 'Trở về',
              onPressed: () {},
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
    Widget logOutButton = Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        child: const Text(
          'Đăng xuất',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
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
                    'Tên: Nguyễn Đan Trường',
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
                  Icon(Icons.person),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('Username: truong307',
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
                  Icon(Icons.lock),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('Password: ********',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Icon(Icons.visibility_off),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.wifi_protected_setup),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.call),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('SDT: 0306201396',
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
                  Icon(Icons.email),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Text('Email: abc123@gmail.com',
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
              onPressed: () {},
              child: Text(
                'Lưu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 50),
              ),
            )
          ],
        ),
      ]),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            logOutButton,
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
