import 'package:doan_android/man_hinh_choi.dart';
import 'package:doan_android/nutchoingay.dart';
import 'package:doan_android/trangchu.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:flutter/material.dart';

class ChoiNgay extends StatefulWidget {
  @override
  State<ChoiNgay> createState() => ChoiNgay_State();
}

class ChoiNgay_State extends State<ChoiNgay> {
  //=========================================//
  //==========================================//
  @override
  Widget build(BuildContext context) {
    //==================================================//
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
                    MaterialPageRoute(builder: (context) => TrangChu()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
    //====================================//
    Widget optionButton = Container(
      margin: const EdgeInsets.only(top: 150),
      child: Column(
        children: <Widget>[
          // Nút độ khó
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
              onPressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.backspace_outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          const Text(
                            "CHẾ ĐỘ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      content: Container(
                        height: 165,
                        child: Column(
                          children: [
                            Container(
                              child: InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    //print("Val--->{}$val");
                                    //isHoverEasy = val;
                                  });
                                },
                                child: ElevatedButton(
                                  onPressed: () {}, // Chưa xử lý
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: 45,
                                      right: 45,
                                    ),
                                    child: Text(
                                      'Dễ',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                onPressed: () {}, // Chưa xử lý
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    left: 3,
                                    right: 3,
                                  ),
                                  child: Text(
                                    "Trung Bình",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {}, // Chưa xử lý
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Text(
                                    "Khó",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }, //Xử lý
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Độ Khó',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Nút lĩnh vực
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.black)),
              onPressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.backspace_outlined),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          const Text(
                            "CHẾ ĐỘ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      content: Container(
                        height: 175,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 14,
                                          right: 14,
                                        ),
                                        child: Text(
                                          'Lịch Sử',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 17,
                                          right: 17,
                                        ),
                                        child: Text(
                                          'Địa Lí',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 5,
                                          right: 5,
                                        ),
                                        child: Text(
                                          'Pháp Luật',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 14,
                                          right: 14,
                                        ),
                                        child: Text(
                                          'Xã Hội',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 1),
                                        child: Text(
                                          'Khoa Học -\n Công Nghệ',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          top: 9,
                                          bottom: 9,
                                          left: 30,
                                          right: 30,
                                        ),
                                        child: Text(
                                          '...',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }, //Chưa xử lý
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Lĩnh Vực',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Nút Bắt đầu
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                elevation: 20,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChoiCaNhan(),
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
        ],
      ),
    );
//============================================================//
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: backButton,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              optionButton,
            ],
          ),
        ),
      ),
    );
  }
}
