import 'package:doan_android/chi_tiet_thach_dau.dart';
import 'package:doan_android/guithachdau.dart';
import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

class resultScreenApp extends StatelessWidget {
  String avt1 = 'user1.png';
  String avt2 = 'user2.png';
  String Core1 = '380';
  String Core2 = '120';
  String Name = 'Admin';
  String imgCupWin = 'win.png';
  String imgCupLose = 'lose.png';
  @override
  Widget build(BuildContext context) {
    Widget _TitleSection = Container(
      padding: const EdgeInsets.only(top: 70),
      child: const Text(
        'KẾT QUẢ',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    Widget imgavt1Section = Container(
      //padding: const EdgeInsets.only(right: 0),
      //color: Colors.yellow,
      child: Image.asset(
        'images/$avt1',
        width: 70,
        height: 70,
      ),
    );
    Widget imgavt2Section = Container(
      //padding: EdgeInsets.only(left: 0),
      child: Image.asset(
        'images/$avt2',
        width: 70,
        height: 70,
      ),
    );
    Widget _CoreSection = Container(
      padding: const EdgeInsets.all(40),
      child: Text(
        '$Core1 : $Core2',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    Widget _ResultSection = Container(
      //color: Colors.red,
      padding: EdgeInsets.only(left: 50, right: 50, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imgavt1Section,
          _CoreSection,
          imgavt2Section,
        ],
      ),
    );
    Widget _NameSection = Container(
      //color: Colors.blue,
      //margin: EdgeInsets.only(left:60,right: 30,top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //color: Colors.red,
            //padding: EdgeInsets.only(left: 50),
            height: 50,
            width: 70,
            child: Center(
              child: Text(
                'Trường',
                style: const TextStyle(
                  overflow: TextOverflow.visible,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            //padding: const EdgeInsets.only(left: 10,right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //padding: const EdgeInsets.all(20),
                minimumSize: Size(100, 50),
                side: BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChiTietThachDau()));
              },
              child: const Text(
                'Xem chi tiết',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            //color: Colors.red,
            //padding: EdgeInsets.only(left: 50),
            height: 50,
            width: 70,
            child: Center(
              child: Text(
                'Sơn',
                style: const TextStyle(
                  overflow: TextOverflow.visible,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Widget _imgCupSection = Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    'images/youwin.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Container(
                  child: Image.asset(
                    'images/$imgCupWin',
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    Widget _Button = Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              //padding: const EdgeInsets.all(20),
              minimumSize: Size(180, 70),
              // side: BorderSide(
              //   width: 3,
              //   color: Colors.black,
              //   ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GuiThachDau()));
            },
            child: const Text(
              'Đấu lại',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              //padding: const EdgeInsets.all(20),
              minimumSize: Size(180, 70),
              // side: BorderSide(
              //   width: 3,
              //   color: Colors.black,
              //   ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrangChu()));
            },
            child: const Text(
              'Trang chủ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _TitleSection,
            _ResultSection,
            _NameSection,
            _imgCupSection,
            _Button,
          ],
        ),
      ),
    );
  }
}
