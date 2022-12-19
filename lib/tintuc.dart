import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

class TinTuc_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tin Tức',
      home: TinTuc_Home(),
    );
  }
}

class TinTuc_Home extends StatefulWidget {
  @override
  State<TinTuc_Home> createState() => TinTuc_State();
}

class TinTuc_State extends State<TinTuc_Home> {
  @override
  Widget build(BuildContext context) {
//==============================================================//
    Widget backButton = Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: IconButton(
              splashRadius: 24,
              tooltip: 'Trở về',
              //Xử trở về trang chủ
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrangChu(),
                  ),
                );
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
//==============================================================//
    Widget textSection = Container(
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TIN TỨC",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
//==============================================================//
    Widget contentSection = Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: ListTile(
              title: const Text(
                'Robot hình người của Tesla ...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  'xem thêm',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          //===========//
          // Container(
          //   margin: EdgeInsets.only(
          //     left: 10,
          //     right: 10,
          //   ),
          //   child: ListTile(
          //     title: const Text(
          //       'Chào mừng đến với bình nguyên vô tận...',
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 15,
          //       ),
          //     ),
          //     trailing: TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         'xem thêm',
          //         style: TextStyle(
          //           fontSize: 10,
          //           color: Colors.blue,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: ListTile(
              title: const Text(
                'Khám phá tính năng của Iphone 14 và...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  'xem thêm',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
//==============================================================//
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              //backButton,
              textSection,
              contentSection,
            ],
          ),
        ),
      ),
    );
  }
}
