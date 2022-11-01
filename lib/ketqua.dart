import 'package:doan_android/choingay.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

class ketQua_Screen extends StatelessWidget {
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
                    'Tên: Nguyễn Văn A',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Độ khó: Trung bình',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Lĩnh vực: Lịch sử',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Điểm: 260',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10, top: 80)),
                  Text(
                    'Thời gian: 21:09 - 22/10/2022',
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
                        'Số đáp án đúng: 26/30',
                        style: TextStyle(fontSize: 25),
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
