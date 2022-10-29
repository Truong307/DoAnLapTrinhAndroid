import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/ket_qua_thach_dau.dart';
import 'package:flutter/material.dart';

class ChiTietThachDau extends StatelessWidget{
  String Player1Name = 'Trường';
  String Player2Name = 'Sơn';
  String CorePlayer1='380';
  String CorePlayer2='120';
  String TimePlayer1='12p20s';
  String TimePlayer2='11p27s';
  String ResultPlayer1='17/20';
  String ResultPlayer2='12/20';
  @override
  Widget build(BuildContext context) {
    Widget _backButton = Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: IconButton(
              splashRadius: 24,
              tooltip: 'Trở về',
              //Xử trở về trang chủ
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => resultScreenApp()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
    Widget _Title = Container(
      //padding: EdgeInsets.all(),
      height: 100,
      width: 300,
      decoration: BoxDecoration(
       color: Colors.blue,
       border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
      ),
      child: Center(
        child: Text(
          "Chi tiết thách đấu",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
    Widget _NameSection = Container(
      //color: Colors.red,
      padding: EdgeInsets.only(left: 40,right: 40,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            //color: Colors.blue,
            child: Text(
              '$Player1Name',
              style: TextStyle(
                overflow: TextOverflow.clip,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Container(
            height: 55,
      width: 100,
      decoration: BoxDecoration(
       color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
      ),
      child: const Center(
        child: Text(
          "Tên",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
          ),
          Container(
            width: 60,
            //color: Colors.blue,
            child: Text(
              '$Player2Name',
              style: TextStyle(
                overflow: TextOverflow.visible,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ],
      ),
    );
    Widget _CoreSection = Container(
      //color: Colors.red,
      padding: EdgeInsets.only(left: 40,right: 40,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            //color: Colors.blue,
            width: 60,
            child: Text(
              '$CorePlayer1',
              style: TextStyle(
                overflow: TextOverflow.clip,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Container(
            height: 55,
      width: 100,
      decoration: BoxDecoration(
       color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
      ),
      child: const Center(
        child: Text(
          "Điểm",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
          ),
          Container(
            width: 60,
            //color: Colors.blue,
            child: Text(
              '$CorePlayer2',
              style: TextStyle(
                overflow: TextOverflow.visible,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ],
      ),
    );
    Widget _TimeSection = Container(
      //color: Colors.red,
      padding: EdgeInsets.only(left: 40,right: 40,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            //color: Colors.blue,
            child: Text(
              '$TimePlayer1',
              style: TextStyle(
                overflow: TextOverflow.clip,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Container(
            height: 55,
      width: 100,
      decoration: BoxDecoration(
       color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
      ),
      child: const Center(
        child: Text(
          "Thời gian",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
          ),
          Container(
           // width: 60,
            //color: Colors.blue,
            child: Text(
              '$TimePlayer2',
              style: TextStyle(
                overflow: TextOverflow.visible,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ],
      ),
    );
    Widget _ResultSection = Container(
      //color: Colors.red,
      padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            //color: Colors.blue,
            child: Text(
              '$ResultPlayer1',
              style: TextStyle(
                overflow: TextOverflow.clip,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Container(
            height: 55,
      width: 150,
      decoration: BoxDecoration(
       color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
      ),
      child: const Center(
        child: Text(
          "Đáp án đúng",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
          ),
          Container(
           // width: 60,
            //color: Colors.blue,
            child: Text(
              '$ResultPlayer2',
              style: TextStyle(
                overflow: TextOverflow.visible,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ],
      ),
    );
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          _backButton,
          _Title,
          _NameSection,
          _CoreSection,
          _TimeSection,
          _ResultSection,
      ],
    ),
    );
  }
}