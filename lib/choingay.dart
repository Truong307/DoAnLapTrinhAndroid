import 'dart:ffi';

import 'package:doan_android/bocauhoi_provider.dart';
import 'package:doan_android/dap_an_object.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:doan_android/nutchoingay.dart';
import 'package:doan_android/trangchu.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChoiNgay extends StatefulWidget {
  @override
  State<ChoiNgay> createState() => ChoiNgay_State();
}

class ChoiNgay_State extends State<ChoiNgay> {
  List<BoCauHoiObject> lsBoCauHoi = [];
  List<BoCauHoiObject> lsDiaLyDe = [];
  List<BoCauHoiObject> lsDiaLyTB = [];
  List<BoCauHoiObject> lsDiaLyKho = [];
  List<BoCauHoiObject> lsLichSuDe = [];
  List<BoCauHoiObject> lsLichSuTB = [];
  List<BoCauHoiObject> lsLichSuKho = [];
  List<UserObject> lsUsers = [];
  List list = [];
  String uid = "";

  void loaddanhsach() async {
    final data1 = await BoCauHoiProvider.layToanBoCauHoi();
    final data2 = await BoCauHoiProvider.layCauHoiLSuDe();
    final data3 = await BoCauHoiProvider.layCauHoiLSuTB();
    final data4 = await BoCauHoiProvider.layCauHoiLSuKho();
    final data5 = await BoCauHoiProvider.layCauHoiDiaLyDe();
    final data6 = await BoCauHoiProvider.layCauHoiDiaLyTB();
    final data7 = await BoCauHoiProvider.layCauHoiDiaLyKho();
    final data8 = await BoCauHoiProvider.danhSachNguoiDung();
    setState(() {});
    lsBoCauHoi = data1;
    lsLichSuDe = data2;
    lsLichSuTB = data3;
    lsLichSuKho = data4;
    lsDiaLyDe = data5;
    lsDiaLyTB = data6;
    lsDiaLyKho = data7;
    lsUsers = data8;
    list.add(lsBoCauHoi);
    list.add(lsLichSuDe);
    list.add(lsLichSuTB);
    list.add(lsLichSuKho);
    list.add(lsDiaLyDe);
    list.add(lsDiaLyTB);
    list.add(lsDiaLyKho);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddanhsach();
    layThongTinUser();
  }

  //=========================================//
  String cheDo = "Độ Khó";
  String linhVuc = "Lĩnh Vực";

  _chonBoCauHoi() {
    if (cheDo == "Dễ" && linhVuc == 'Lịch Sử') {
      return 1;
    }
    if (cheDo == "Trung Bình" && linhVuc == 'Lịch Sử') {
      return 2;
    }
    if (cheDo == "Khó" && linhVuc == 'Lịch Sử') {
      return 3;
    }
    if (cheDo == "Dễ" && linhVuc == 'Địa Lý') {
      return 4;
    }
    if (cheDo == "Trung Bình" && linhVuc == 'Địa Lý') {
      return 5;
    }
    if (cheDo == "Khó" && linhVuc == 'Địa Lý') {
      return 6;
    }
  }

  hienThongTinUser() {
    for (int i = 0; i < lsUsers.length; i++) {
      if (lsUsers[i].uid == uid) {
        return lsUsers[i];
      }
    }
  }

  layThongTinUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uid = user.uid;
      }
    });
  }

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
                                  onPressed: () {
                                    setState(() {
                                      //print("Val--->{}$val");
                                      //isHoverEasy = val;
                                      cheDo = "Dễ";
                                    });
                                    Navigator.pop(context);
                                  }, // Chưa xử lý
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
                                onPressed: () {
                                  setState(() {
                                    //print("Val--->{}$val");
                                    //isHoverEasy = val;
                                    cheDo = "Trung Bình";
                                  });
                                  Navigator.pop(context);
                                }, // Chưa xử lý
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
                                onPressed: () {
                                  setState(() {
                                    //print("Val--->{}$val");
                                    //isHoverEasy = val;
                                    cheDo = "Khó";
                                  });
                                  Navigator.pop(context);
                                }, // Chưa xử lý
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
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  '$cheDo',
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
                                      onPressed: () {
                                        setState(() {
                                          linhVuc = "Lịch Sử";
                                        });
                                        Navigator.pop(context);
                                      },
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
                                      onPressed: () {
                                        setState(() {
                                          linhVuc = "Địa Lý";
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 17,
                                          right: 17,
                                        ),
                                        child: Text(
                                          'Địa Lý',
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
                            // Container(
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         margin: const EdgeInsets.all(5),
                            //         child: ElevatedButton(
                            //           onPressed: () {},
                            //           child: const Padding(
                            //             padding: EdgeInsets.only(
                            //               top: 10,
                            //               bottom: 10,
                            //               left: 5,
                            //               right: 5,
                            //             ),
                            //             child: Text(
                            //               'Pháp Luật',
                            //               style: TextStyle(
                            //                 fontSize: 15,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         margin: EdgeInsets.all(5),
                            //         child: ElevatedButton(
                            //           onPressed: () {},
                            //           child: const Padding(
                            //             padding: EdgeInsets.only(
                            //               top: 10,
                            //               bottom: 10,
                            //               left: 14,
                            //               right: 14,
                            //             ),
                            //             child: Text(
                            //               'Xã Hội',
                            //               style: TextStyle(
                            //                 fontSize: 15,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         margin: const EdgeInsets.all(5),
                            //         child: ElevatedButton(
                            //           onPressed: () {},
                            //           child: const Padding(
                            //             padding: EdgeInsets.only(top: 1),
                            //             child: Text(
                            //               'Khoa Học -\n Công Nghệ',
                            //               style: TextStyle(
                            //                 fontSize: 15,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         margin: const EdgeInsets.all(5),
                            //         child: ElevatedButton(
                            //           onPressed: () {},
                            //           child: const Padding(
                            //             padding: EdgeInsets.only(
                            //               top: 9,
                            //               bottom: 9,
                            //               left: 8,
                            //               right: 8,
                            //             ),
                            //             child: Text(
                            //               'Văn Học',
                            //               style: TextStyle(
                            //                 fontSize: 15,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }, //Chưa xử lý
              child: Padding(
                padding: EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  '$linhVuc',
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
                if (linhVuc == "Lĩnh Vực" || cheDo == "Độ Khó") {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.blue,
                          ),
                          title: Text("Thông Báo"),
                          content: Text(
                            'Hãy chọn chế độ chơi',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChoiCaNhan(
                        list: list[_chonBoCauHoi()],
                        User: hienThongTinUser(),
                      ),
                    ),
                  );
                }
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
