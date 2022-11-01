import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

class LichSuChoi_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Thông Báo",
      
      home: LichSuChoi_Home(),
    );
  }
}

class LichSuChoi_Home extends StatefulWidget {
  @override
  State<LichSuChoi_Home> createState() => LichSuChoi_State();
}

class LichSuChoi_State extends State<LichSuChoi_Home> {
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
              "LỊCH SỬ CHƠI",
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
                'Cá nhân',
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
                'Thách đấu',
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
                'Lĩnh vực: Xã hội',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: const Text(
                '15:00 29-10-2022',
                style: TextStyle(
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [ 
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {}, // Chưa xử lý
                      child: const Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.blue),
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
                'Lĩnh vực: Địa lý',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: const Text(
                '20:33 4-11-2022',
                style: TextStyle(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {}, // Chưa xử lý
                      child: const Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.blue),
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
        backgroundColor: Color.fromARGB(250, 250, 250, 250),
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
