import 'package:doan_android/ketqua.dart';
import 'package:flutter/material.dart';

class XemLaiCauHoi extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => ketQua_Screen()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
          Padding(padding: EdgeInsets.all(35)),
          Column(
            children: [
              Container(
                child: Text(
                  'Chi Tiết Câu Hỏi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    Widget soLuongCauHoi = Container(
      // padding: EdgeInsets.all(10),
      // child: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 10,
      //     ),
      //     itemCount: 20,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Card(
      //         color: Colors.amber,
      //         child: Center(child: Text('$index')),
      //       );
      //     }),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '6',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 3)),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '11',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '13',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 79, 231, 84),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '14',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '15',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '16',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 3)),
          Row(children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 79, 231, 84),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 0),
                    ),
                    onPressed: () {},
                    child: Text(
                      '17',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(2)),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 79, 231, 84),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 0),
                    ),
                    onPressed: () {},
                    child: Text(
                      '18',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(2)),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 79, 231, 84),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 0),
                    ),
                    onPressed: () {},
                    child: Text(
                      '19',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(2)),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 0),
                    ),
                    onPressed: () {},
                    child: Text(
                      '20',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
//==============================================//
    Widget cauHoiSection = Container(
      padding: EdgeInsets.all(30),
      child: Text(
        'Câu 10: Bạn hãy cho biết 1 + 1 = ?',
        style: TextStyle(
          color: Color.fromARGB(250, 250, 250, 250),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
//==============================================//
    Widget contentSection = Container(
      width: double.infinity,
      height: 350,
      margin: EdgeInsets.only(
        top: 15,
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
//==============================================//
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
                  onPressed: () {}, // Chưa xử lý
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
                  onPressed: () {}, // Chưa xử lý
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
                  onPressed: () {}, // Chưa xử lý
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
                  onPressed: () {}, // Chưa xử lý
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
            soLuongCauHoi,
            contentSection,
            dapAnSection,
          ],
        )),
      ),
    );
  }
}
