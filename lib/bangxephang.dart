import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:doan_android/lichsu_object.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'banbe_object.dart';
import 'lichsu_object.dart';

class bangXepHangStateLess extends StatefulWidget {
  @override
  State<bangXepHangStateLess> createState() => _bangXepHangState();
}

class _bangXepHangState extends State<bangXepHangStateLess>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController2;
  final ref = FirebaseDatabase.instance.ref();
  List<LichSuObject1> lsLichSu = [];
  List<LichSuObject1> lsLichSu2 = [];
  List<UserObject> lsNguoiDung = [];
  List<BanBeObject> lsBanBe = [];
  String uidUser = '';
  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    _tabController2 = new TabController(length: 3, vsync: this);
    super.initState();
    hienThongTin();
    retrieveKetQuaData();
    retrieveBanBeData();
    retrieveKetQuaBanBeData();
    //SapXep();
    //retrieveBanBeData2();
    if (mounted) {
      setState(() {});
    }
  }

  void retrieveKetQuaData() {
    ref.child("LichSuChoi").orderByChild('Diem').onChildAdded.listen((data) {
      LichSuObject1 LichSuObject2 =
          LichSuObject1.fromJson(data.snapshot.value as Map);
      lsLichSu.add(LichSuObject2);
    });
    //lsLichSu.reversed;
    if (mounted) {
      setState(() {});
    }
  }

  void retrieveKetQuaBanBeData() {
    ref.child("LichSuChoi").orderByChild('Diem').onChildAdded.listen((data) {
      // LichSuObject LichSuObject1 =
      //     LichSuObject.fromJson(data.snapshot.value as Map);
      // lsLichSu.add(LichSuObject1);
      for (int i = 0; i < lsBanBe.length; i++) {
        if (data.snapshot.child("Uid").value.toString() ==
                lsBanBe[i].NguoiDung2.toString() &&
            lsBanBe[i].NguoiDung1 == uidUser) {
          LichSuObject1 LichSuObject2 =
              LichSuObject1.fromJson(data.snapshot.value as Map);
          lsLichSu2.add(LichSuObject2);
        }
      }
    });
    if (mounted) {
      setState(() {});
    }
  }

  void SapXep() {
    if (lsLichSu2.length > 0) {
      for (int i = 0; i < lsLichSu2.length - 1; i++) {
        for (int j = i + 1; j < lsLichSu2.length; j++) {
          if (lsLichSu2[i].Uid.toString() == lsLichSu2[j].Uid.toString()) {
            lsLichSu2.removeAt(j);
          }
        }
      }
      if (mounted) {
        setState(() {});
      }
    }
  }

  void retrieveBanBeData() {
    ref.child("BanBe").onChildAdded.listen((data) {
      BanBeObject BanBeObject1 =
          BanBeObject.formJson(data.snapshot.value as Map);
      lsBanBe.add(BanBeObject1);
      if (mounted) {
        setState(() {});
      }
    });
  }

  void hienThongTin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    if (mounted) {
      setState(() {});
    }
  }

  // void retrieveBanBeData2() {
  //   ref.child("Users").onChildAdded.listen((data) {
  //     UserObject UserObject1 = UserObject.formJson(data.snapshot.value as Map);
  //     lsNguoiDung.add(UserObject1);
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(padding: EdgeInsets.all(50)),
            Text(
              'BẢNG XẾP HẠNG',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController2,
          tabs: <Widget>[
            Row(children: [
              Icon(Icons.all_inclusive),
              SizedBox(width: 5),
              Text("Tất cả")
            ]),
            Row(children: [
              Icon(Icons.category),
              SizedBox(width: 5),
              Text("Lĩnh vực")
            ]),
            Row(children: [
              Icon(Icons.people),
              SizedBox(width: 5),
              Text("Bạn bè")
            ]),
          ],
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          unselectedLabelStyle:
              TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 432,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1),
                        bottom: BorderSide(width: 1)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 130, bottom: 20)),
                          Text('Thứ hạng',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17)),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 150, bottom: 20)),
                          Text('Tên',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17))
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 150, bottom: 20)),
                          Text('Điểm',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Card(
            //   color: Colors.grey[300],
            //   margin: const EdgeInsets.only(
            //     top: 15,
            //     left: 15,
            //     right: 15,
            //   ),
            //   child: ListTile(
            //     title: Container(
            //       padding: EdgeInsets.only(left: 55),
            //       child: Text(
            //         'Tên',
            //         style: TextStyle(
            //           color: Color.fromARGB(255, 226, 25, 7),
            //           fontWeight: FontWeight.bold,
            //           fontSize: 15,
            //         ),
            //       ),
            //     ),
            //     trailing: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Container(
            //           padding: EdgeInsets.only(right: 20),
            //           child: Text(
            //             'Điểm',
            //             style: TextStyle(
            //               color: Color.fromARGB(255, 226, 25, 7),
            //               fontWeight: FontWeight.bold,
            //               fontSize: 15,
            //             ),
            //           ),
            //         ),
            //         Container(
            //           margin: const EdgeInsets.all(10),
            //           child: Text(
            //             'Số Đáp Án Đúng',
            //             style: TextStyle(
            //               color: Color.fromARGB(255, 226, 25, 7),
            //               fontWeight: FontWeight.bold,
            //               fontSize: 15,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: TabBarView(
                controller: _tabController2,
                children: <Widget>[
                  //tabbar BXH TẤT CẢ
                  Container(
                    child: ListView.builder(
                      //reverse: true,
                      itemCount: lsLichSu.length != 0
                          ? lsLichSu.length < 10
                              ? lsLichSu.length
                              : 10
                          : 0,
                      itemBuilder: (context, index) => Card(
                        color: Color.fromARGB(250, 250, 250, 250),
                        margin: const EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 15,
                        ),
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  lsLichSu.length != 0
                                      ? (index + 1).toString()
                                      : '',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // leading: Text(
                          //   lsLichSu.length != 0 ? (index + 1).toString() : '',
                          //   style: TextStyle(
                          //     color: Colors.red,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 15,
                          //   ),
                          // ),
                          title: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 110),
                                child: Text(
                                  lsLichSu.length != 0
                                      ? lsLichSu[lsLichSu.length - 1 - index]
                                          .Ten
                                          .toString()
                                      : '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // title: Text(
                          //   lsLichSu.length != 0
                          //       ? lsLichSu[lsLichSu.length - 1 - index]
                          //           .Ten
                          //           .toString()
                          //       : '',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 15,
                          //   ),
                          // ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 30),
                                child: Text(
                                  lsLichSu.length != 0
                                      ? lsLichSu[lsLichSu.length - 1 - index]
                                          .Diem
                                          .toString()
                                      : '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              // Container(
                              //   //margin: const EdgeInsets.all(10),
                              //   padding: EdgeInsets.only(right: 80),
                              //   child: Text(
                              //     lsLichSu.length != 0
                              //         ? lsLichSu[lsLichSu.length - 1 - index]
                              //             .SoDapAnDung
                              //             .toString()
                              //         : '',
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 15,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //tabar BXH LĨNH VỰC
                  Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: TabBar(
                            unselectedLabelColor: Colors.black,
                            labelColor: Colors.red,
                            tabs: [
                              Tab(
                                child: Text(
                                  'Lịch sử',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Khoa Học -\n Công Nghệ',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Địa lý',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Xã hội',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Pháp luật',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Văn Học',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                            isScrollable: true,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: TabBarView(
                            children: [
                              Container(
                                child: Column(children: [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 432,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1)),
                                        ),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('Thứ hạng',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Tên',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Điểm',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 15)),
                                                Text('1',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('Nguyễn Văn A',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('9999',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('2',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Trần Thị B',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '8888',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('3',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 190, 123, 22),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Lê B D',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '7777',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                              Container(
                                child: Column(children: [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 432,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1)),
                                        ),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('Thứ hạng',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Tên',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Điểm',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 15)),
                                                Text('1',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('Nguyễn Văn A',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('9999',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('2',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Trần Thị B',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '8888',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('3',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 190, 123, 22),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Lê B D',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '7777',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                              Container(
                                child: Column(children: [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1)),
                                        ),
                                        height: 60,
                                        width: 432,
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('Thứ hạng',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Tên',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Điểm',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 15)),
                                                Text('1',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('Nguyễn Văn A',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('9999',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('2',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Trần Thị B',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '8888',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('3',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 190, 123, 22),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Lê B D',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '7777',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                              Container(
                                child: Column(children: [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1)),
                                        ),
                                        height: 60,
                                        width: 432,
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('Thứ hạng',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Tên',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Điểm',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 15)),
                                                Text('1',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('Nguyễn Văn A',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('9999',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('2',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Trần Thị B',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '8888',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('3',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 190, 123, 22),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Lê B D',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '7777',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                              Container(
                                child: Column(children: [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1)),
                                        ),
                                        height: 60,
                                        width: 432,
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('Thứ hạng',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Tên',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Điểm',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 15)),
                                                Text('1',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('Nguyễn Văn A',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 15)),
                                                Text('9999',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('2',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Trần Thị B',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '8888',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('3',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 190, 123, 22),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Lê B D',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text(
                                                  '7777',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                              Container(
                                child: Column(children: [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1)),
                                        ),
                                        height: 60,
                                        width: 432,
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 160,
                                                        bottom: 20)),
                                                Text('Thứ hạng',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Tên',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 130,
                                                        bottom: 20)),
                                                Text('Điểm',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       child: Row(
                                  //         children: [
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 160,
                                  //                       bottom: 15)),
                                  //               Text('1',
                                  //                   style: TextStyle(
                                  //                       color: Colors.amber,
                                  //                       fontSize: 17,
                                  //                       fontWeight:
                                  //                           FontWeight.bold)),
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 130,
                                  //                       bottom: 15)),
                                  //               Text('Nguyễn Văn A',
                                  //                   style: TextStyle(
                                  //                       color: Colors.black,
                                  //                       fontSize: 17))
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 130,
                                  //                       bottom: 15)),
                                  //               Text('9999',
                                  //                   style: TextStyle(
                                  //                     color: Colors.black,
                                  //                     fontSize: 17,
                                  //                   ))
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       child: Row(
                                  //         children: [
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 160,
                                  //                       bottom: 20)),
                                  //               Text('2',
                                  //                   style: TextStyle(
                                  //                       color: Colors.grey,
                                  //                       fontSize: 17,
                                  //                       fontWeight:
                                  //                           FontWeight.bold)),
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 130,
                                  //                       bottom: 20)),
                                  //               Text('Trần Thị B',
                                  //                   style: TextStyle(
                                  //                       color: Colors.black,
                                  //                       fontSize: 17))
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 130,
                                  //                       bottom: 20)),
                                  //               Text(
                                  //                 '8888',
                                  //                 style: TextStyle(
                                  //                   color: Colors.black,
                                  //                   fontSize: 17,
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       child: Row(
                                  //         children: [
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 160,
                                  //                       bottom: 20)),
                                  //               Text('3',
                                  //                   style: TextStyle(
                                  //                       color: Color.fromARGB(
                                  //                           255, 190, 123, 22),
                                  //                       fontSize: 17,
                                  //                       fontWeight:
                                  //                           FontWeight.bold)),
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 130,
                                  //                       bottom: 20)),
                                  //               Text('Lê B D',
                                  //                   style: TextStyle(
                                  //                       color: Colors.black,
                                  //                       fontSize: 17))
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       right: 130,
                                  //                       bottom: 20)),
                                  //               Text(
                                  //                 '7777',
                                  //                 style: TextStyle(
                                  //                   color: Colors.black,
                                  //                   fontSize: 17,
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ]),
                              ),
                            ],
                            controller: _tabController,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //tabbar BXH BẠN BÈ
                  Container(
                    child: Column(children: [
                      Padding(padding: EdgeInsets.all(3)),
                      Row(
                        children: [
                          // Container(
                          //   height: 60,
                          //   width: 432,
                          //   decoration: BoxDecoration(
                          //     border: Border(
                          //         top: BorderSide(width: 1),
                          //         bottom: BorderSide(width: 1)),
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       Column(
                          //         children: [
                          //           Padding(
                          //               padding: EdgeInsets.only(
                          //                   right: 160, bottom: 20)),
                          //           Text('Thứ hạng',
                          //               style: TextStyle(
                          //                   color: Colors.black, fontSize: 17)),
                          //         ],
                          //       ),
                          //       Column(
                          //         children: [
                          //           Padding(
                          //               padding: EdgeInsets.only(
                          //                   right: 130, bottom: 20)),
                          //           Text('Tên',
                          //               style: TextStyle(
                          //                   color: Colors.black, fontSize: 17))
                          //         ],
                          //       ),
                          //       Column(
                          //         children: [
                          //           Padding(
                          //               padding: EdgeInsets.only(
                          //                   right: 130, bottom: 20)),
                          //           Text('Điểm',
                          //               style: TextStyle(
                          //                   color: Colors.black, fontSize: 17))
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          //reverse: true,
                          itemCount: lsLichSu2.length != 0
                              ? lsLichSu2.length < 10
                                  ? lsLichSu2.length
                                  : 10
                              : 0,
                          itemBuilder: (context, index) => Card(
                            color: Color.fromARGB(250, 250, 250, 250),
                            margin: const EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 15,
                            ),
                            child: ListTile(
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Text(
                                      lsLichSu2.length != 0
                                          ? (index + 1).toString()
                                          : '',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // leading: Text(
                              //   lsLichSu.length != 0 ? (index + 1).toString() : '',
                              //   style: TextStyle(
                              //     color: Colors.red,
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 15,
                              //   ),
                              // ),
                              title: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 110),
                                    child: Text(
                                      lsLichSu2.length != 0
                                          ? lsLichSu2[
                                                  lsLichSu2.length - 1 - index]
                                              .Ten
                                              .toString()
                                          : '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // title: Text(
                              //   lsLichSu.length != 0
                              //       ? lsLichSu[lsLichSu.length - 1 - index]
                              //           .Ten
                              //           .toString()
                              //       : '',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 15,
                              //   ),
                              // ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text(
                                      lsLichSu2.length != 0
                                          ? lsLichSu2[
                                                  lsLichSu2.length - 1 - index]
                                              .Diem
                                              .toString()
                                          : '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   //margin: const EdgeInsets.all(10),
                                  //   padding: EdgeInsets.only(right: 80),
                                  //   child: Text(
                                  //     lsLichSu.length != 0
                                  //         ? lsLichSu[lsLichSu.length - 1 - index]
                                  //             .SoDapAnDung
                                  //             .toString()
                                  //         : '',
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 160, bottom: 15)),
                      //               Text('1',
                      //                   style: TextStyle(
                      //                       color: Colors.amber,
                      //                       fontSize: 17,
                      //                       fontWeight: FontWeight.bold)),
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 130, bottom: 15)),
                      //               Text('Nguyễn Văn A',
                      //                   style: TextStyle(
                      //                       color: Colors.black, fontSize: 17))
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 130, bottom: 15)),
                      //               Text('9999',
                      //                   style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 17,
                      //                   ))
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 160, bottom: 20)),
                      //               Text('2',
                      //                   style: TextStyle(
                      //                       color: Colors.grey,
                      //                       fontSize: 17,
                      //                       fontWeight: FontWeight.bold)),
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 130, bottom: 20)),
                      //               Text('Trần Thị B',
                      //                   style: TextStyle(
                      //                       color: Colors.black, fontSize: 17))
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 130, bottom: 20)),
                      //               Text(
                      //                 '8888',
                      //                 style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontSize: 17,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 160, bottom: 20)),
                      //               Text('3',
                      //                   style: TextStyle(
                      //                       color: Color.fromARGB(
                      //                           255, 190, 123, 22),
                      //                       fontSize: 17,
                      //                       fontWeight: FontWeight.bold)),
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 130, bottom: 20)),
                      //               Text('Lê B D',
                      //                   style: TextStyle(
                      //                       color: Colors.black, fontSize: 17))
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 130, bottom: 20)),
                      //               Text(
                      //                 '7777',
                      //                 style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontSize: 17,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
