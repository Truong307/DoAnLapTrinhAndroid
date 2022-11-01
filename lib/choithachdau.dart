import 'package:doan_android/choingay.dart';
import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/guithachdau.dart';
import 'package:doan_android/ket_qua_thach_dau.dart';
import 'package:flutter/material.dart';

class BatDauScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//=======================================================//
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
                    MaterialPageRoute(builder: (context) => GuiThachDau()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Text('NguoiChoi vs Lelouch', style: TextStyle(color: Colors.deepOrange),),)
        ],
      ),
    );
//=========================================================//
    Widget cauHoiSection = Container(
      padding: EdgeInsets.all(30),
      child: Text(
        'Câu 1: Bạn hãy cho biết 1 + 1 = ?',
        style: TextStyle(
          color: Color.fromARGB(250, 250, 250, 250),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
//========================================================//
    Widget contentSection = Container(
      width: double.infinity,
      height: 400,
      margin: EdgeInsets.only(
        top: 25,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: cauHoiSection,
    );
//=========================================================//
    Widget diemSection = Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 30,
            right: 30,
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Text(
            '1000',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
//=========================================================//
    Widget goiYSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '50:50',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Mua',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
//=========================================================//
    Widget timeSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Icon(
              Icons.alarm_outlined,
              size: 35,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 2,
              bottom: 5,
              right: 20,
              top: 10,
            ),
            child: Text(
              '30',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
//=========================================================//
    Widget dapAnSection = Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 70),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => resultScreenApp()));
                  }, // Chưa xử lý
                  child: Text(
                    'A. -1',
                    style: TextStyle(
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 70),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => resultScreenApp()));
                  }, // Chưa xử lý
                  child: Text(
                    'B. 0',
                    style: TextStyle(
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  right: 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 70),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => resultScreenApp()));
                  }, // Chưa xử lý
                  child: Text(
                    'C. 2002',
                    style: TextStyle(
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 79, 231, 84),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 70),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => resultScreenApp()));
                  }, // Chưa xử lý
                  child: Text(
                    'D. 2',
                    style: TextStyle(
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
//=========================================================//
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 250, 250, 250),
        title: backButton,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              goiYSection,
              timeSection,
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  contentSection,
                  diemSection,
                ],
              ),
              dapAnSection,
            ],
          ),
        ),
      ),
    );
  }
}
