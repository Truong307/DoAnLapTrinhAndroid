import 'dart:async';

import 'package:doan_android/cauhoi_object.dart';
import 'package:doan_android/choingay.dart';
import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/guithachdau.dart';
import 'package:doan_android/ket_qua_thach_dau.dart';
import 'package:doan_android/ketqua.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChoiCaNhan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChoiCaNhanState();
  }
}

class ChoiCaNhanState extends State<ChoiCaNhan> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  List<CauHoi> lsCauHoi = [];
  int time = 30;
  int i = 0;
  int diem = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Truy xuất dữ liệu Câu Hỏi
    retrieveCauHoiData();
  }

  void _tangI() {
    setState(() {
      i++;
    });
  }

  void retrieveCauHoiData() {
    ref.child("CauHoi").onChildAdded.listen((data) {
      CauHoiObject cauHoiObject =
          CauHoiObject.fromJson(data.snapshot.value as Map);
      CauHoi cauHoi =
          CauHoi(key: data.snapshot.key.hashCode, cauHoiObject: cauHoiObject);
      lsCauHoi.add(cauHoi);
      setState(() {});
    });
  }

  void _thoiGianChoi() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          time--;
        });
      } else if (time == 30) {
        setState(() {
          time--;
        });
      } else {
        timer.cancel();
        setState(() {
          i++;
          time = 30;
          _thoiGianChoi();
        });
      }
    });
  }

  _hienCauHoi() {
    if (lsCauHoi[i].cauHoiObject!.doKho.toString() == "Dễ") {
      return 'Câu ${i + 1}: ${lsCauHoi[i].cauHoiObject!.tenCauHoi.toString()}';
    }
    return "Null";
  }

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
                    MaterialPageRoute(builder: (context) => ChoiNgay()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
          Padding(padding: EdgeInsets.all(95)),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'truong307',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          CircleAvatar(
            child: Image.asset("images/user1.png"),
          ),
        ],
      ),
    );
//=========================================================//
    Widget cauHoiSection = Container(
      padding: EdgeInsets.all(30),
      child: Text(
        _hienCauHoi(),
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
            '$diem',
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
              onPressed: () {
                _thoiGianChoi();
              },
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
              time.toString(),
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
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(200, 90),
                  ),
                  onPressed: () {
                    if (i == 9) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ketQua_Screen()));
                    } else {
                      _tangI();
                      time = 30;
                    }
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
                    minimumSize: Size(200, 90),
                  ),
                  onPressed: () {
                    if (i == 9) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ketQua_Screen()));
                    } else {
                      _tangI();
                      time = 30;
                    }
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
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(200, 90),
                  ),
                  onPressed: () {
                    if (i == 9) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ketQua_Screen()));
                    } else {
                      _tangI();
                      time = 30;
                    }
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
                    minimumSize: Size(200, 90),
                  ),
                  onPressed: () {
                    if (i == 9) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ketQua_Screen()));
                    } else {
                      _tangI();
                      time = 30;
                    }
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
        backgroundColor: Colors.white,
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
