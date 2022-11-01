import 'package:doan_android/banbe.dart';
import 'package:doan_android/choithachdau.dart';
import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

class ThongBao_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Thông Báo",
      home: ThongBao_Home(),
    );
  }
}

class ThongBao_Home extends StatefulWidget {
  @override
  State<ThongBao_Home> createState() => ThongBao_State();
}

class ThongBao_State extends State<ThongBao_Home> {
  @override
  Widget build(BuildContext context) {
//======================================================//
    Widget headSection = Container(
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
          Container(
            margin: EdgeInsets.only(left: 80),
            child: const Text(
              "Thông báo",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
//======================================================//
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.blue,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 15,
        bottom: 15,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );

//========================================================//
    Widget optionSection = Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {}, // Chưa xử lý
              child: const Text(
                'Tất cả',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {}, // Chưa xử lý
              child: const Text(
                'Chưa đọc',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
//======================================================//
    Widget contentSection = Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Card(
            color: Colors.grey[300],
            margin: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            child: ListTile(
              title: const Text(
                'User đã gửi Yêu cầu thách đấu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: const Text(
                '1 phút trước',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BatDauScreen()));
                      }, // Chưa xử lý
                      child: Text(
                        'Chấp nhận',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {}, // Chưa xử lý
                      child: const Text(
                        'Từ chối',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //===========//
          Card(
            color: Colors.grey[300],
            margin: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            child: ListTile(
              title: const Text(
                'User đã gửi lời mời kết bạn',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: const Text(
                '30 phút trước',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () {
                      }, // Chưa xử lý
                      child: const Text(
                        'Chấp nhận',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {}, // Chưa xử lý
                      child: const Text(
                        'Từ chối',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
//======================================================//
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            headSection,
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              optionSection,
              contentSection,
            ],
          ),
        ),
      ),
    );
  }
}
