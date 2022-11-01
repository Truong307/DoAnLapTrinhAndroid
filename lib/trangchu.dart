import 'dart:ui';
import 'package:doan_android/nutchoingay.dart';
import 'package:doan_android/thongbao.dart';
import 'package:flutter/material.dart';

class TrangChu extends StatefulWidget {
  @override
  State<TrangChu> createState() => TrangChu_State();
}

class TrangChu_State extends State<TrangChu> {
  int _selectedIndex = 2;

  void OntabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> lsSreen = [
    Text('Màn hình xếp hạng'),
    Text('Màn hình tin tức '),
    playButton(),
    Text('Màn hình bạn bè'),
    Text('Màn hình hồ sơ'),
  ];

  @override
  Widget build(BuildContext context) {
//===================================================//
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset("images/user1.png"),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Admin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            IconButton(
              splashRadius: 24,
              tooltip: 'Thông báo',
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.grey,
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThongBao_App(),
                  ),
                );
              }, // Chưa xử lý
            ),
            IconButton(
              splashRadius: 24,
              tooltip: 'Thông báo',
              //icon: Image.asset("images/bell.png"),
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              iconSize: 30,
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThongBao_App(),
                  ),
                );*/
              }, // Chưa xử lý
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        backgroundColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: OntabSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.signal_cellular_alt_outlined,
              size: 30,
            ),
            label: 'Xếp Hạng',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper_outlined,
              size: 30,
            ),
            label: 'Tin Tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_outline,
              size: 30,
            ),
            label: 'Bạn Bè',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            label: 'Hồ Sơ',
          ),
        ],
      ),
      body: lsSreen[_selectedIndex],
    );
  }
}
