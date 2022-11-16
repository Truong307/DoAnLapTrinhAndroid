import 'package:doan_android/choingay.dart';
import 'package:flutter/material.dart';

class playButton extends StatefulWidget {
  @override
  State<playButton> createState() => playButton_State();
}

class playButton_State extends State<playButton> {
  
  @override
  Widget build(BuildContext context) {
    Widget logo = Container(
      child: Image.asset(
        'images/logo_CKC_Quiz.png',
        width: 350,
        height: 350,
        fit: BoxFit.cover,
      ),
    );
    Widget Play = Container(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: Color.fromARGB(255, 46, 181, 244),
            minimumSize: const Size(230, 110),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          // Xử lý sang trang chơi ngay
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChoiNgay(),
              ),
            );
          }, //=========================//
          icon: Image.asset(
            "images/play.png",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          label: Text(
            'CHƠI NGAY',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
    return Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 30)),
        logo,
        Padding(padding: EdgeInsets.only(top: 40)),
        Play,
      ],
      )
    );
  }
}
