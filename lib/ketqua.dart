import 'package:flutter/material.dart';

class ketQua_Screen extends StatelessWidget {
  Widget noiDung = Column(
    children: [
      Padding(padding: EdgeInsets.all(20)),
      Container(
        width: 480,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.blue,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 80, left: 170)),
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
                Padding(padding: EdgeInsets.only(left: 30, top: 80)),
                Text(
                  'Tên: Nguyễn Văn A',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30, top: 80)),
                Text(
                  'Điểm: 260',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30, top: 80)),
                Text(
                  'Thời gian: 21:09 - 22/10/2022',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30, top: 80)),
                Column(
                  children: [
                    Text(
                      'Số đáp án đúng: 26/30',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 130)),
                    ElevatedButton(
                      onPressed: () {},
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
        Padding(padding: EdgeInsets.only(left: 30, top: 150)),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Tiếp tục',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 70),
                side: BorderSide(),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: 60, top: 150)),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Trang chủ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 70),
                side: BorderSide(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kết quả',
      home: Scaffold(
        body: Column(
          children: [
            noiDung,
            button,
          ],
        ),
      ),
    );
  }
}
