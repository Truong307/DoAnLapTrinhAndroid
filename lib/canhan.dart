import 'package:flutter/material.dart';

class caNhan_Screen extends StatelessWidget {
  @override
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
    padding: EdgeInsets.only(left: 320, bottom: 10),
    child: ElevatedButton(
      onPressed: () {},
      child: const Text('Đăng xuất'),
    ),
  );
  Widget avartar = const CircleAvatar(
    radius: 95,
    backgroundColor: Color(0xffFDCF09),
    child: CircleAvatar(
      backgroundColor: Color.fromARGB(255, 124, 117, 117),
      radius: 90,
      backgroundImage: NetworkImage("images/hacker.png"),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
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
              minimumSize: Size(300, 50),
            ),
          )
        ],
      ),
      Padding(padding: EdgeInsets.only(right: 35)),
      Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Lưu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
            ),
          )
        ],
      ),
    ]),
  );
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Màn hình cá nhân',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                backButton,
                logOutButton,
              ],
            ),
            avartar,
            content,
            bottomButton,
          ],
        ),
      ),
    );
  }
}
