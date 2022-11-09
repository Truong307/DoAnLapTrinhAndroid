import 'package:doan_android/choingay.dart';
import 'package:doan_android/lichsuchoicanhan.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:doan_android/trangchu.dart';
import 'package:doan_android/xemlaicauhoi.dart';
import 'package:flutter/material.dart';

class chiTietLichSu extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => LichSuChoiCaNhan()));
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
