import 'package:doan_android/choithachdau.dart';
import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

class phongChoThachDau extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget backButton = Container(
      child: Row(children: [
        Container(
          child: IconButton(
            splashRadius: 24,
            tooltip: 'Trở về',
            //Xử trở về trang chủ
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TrangChu()));
            },
            //========================//
            icon: Image.asset('images/undo.png'),
            iconSize: 40,
          ),
        ),
      ]),
    );
    Widget Texts = Container(
      padding: EdgeInsets.all(30),
      child: Text('THÁCH ĐẤU ĐỈNH CAO', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),),
    );
    Widget ChoThiDau = Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      padding: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Column(
            children: [
              CircleAvatar(
                radius: 95,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 124, 117, 117),
                  radius: 90,
                  backgroundImage: AssetImage('images/hacker.png'),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                'Người chơi 1',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'VS',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 95,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 124, 117, 117),
                  radius: 90,
                  backgroundImage: AssetImage('images/hacker.png'),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                'Người chơi 2',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    Widget batDauButton = Container(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            elevation: 20,
            minimumSize: Size(230, 90),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BatDauScreen(),
              ),
            );
          }, //Chưa xử lý
          child: const Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 20,
              bottom: 20,
            ),
            child: Text(
              'Bắt Đầu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: backButton,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Texts,
              Padding(padding: EdgeInsets.only(top: 100)),
              ChoThiDau,
              batDauButton,
            ],
          ),
        ),
      ),
    );
  }
}
