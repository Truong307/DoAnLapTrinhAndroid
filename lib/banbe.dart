import 'dart:math';

import 'package:doan_android/banbe_object.dart';
import 'package:doan_android/guithachdau.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'nguoidung_object.dart';

class banBe_Screen extends StatefulWidget {
  const banBe_Screen({super.key});

  @override
  State<banBe_Screen> createState() => _banBe_ScreenState();
}

class _banBe_ScreenState extends State<banBe_Screen> {
  final ref = FirebaseDatabase.instance.ref();
  List<BanBeObject> lsBanBe = [];
  List<UserObject> lsNguoiDung = [];
  List<UserObject> lsNguoiDung2 = [];
  List<UserObject> lsTimKiem = [];
  String uidUser = '';
  String FullNameUser = '';
  int abc = 0;
  TextEditingController strSearch = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Truy xuất dữ liệu bạn bè
    retrieveBanBeData();
    // Truy xuất dữ liệu người dùng
    retrieveBanBeData2();
    retrieveUserData();
    hienThongTin();
    if (mounted) {
      setState(() {});
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
  }

  layFullName() {
    String fullname = "";
    for (int i = 0; i < lsNguoiDung2.length; i++) {
      if (lsNguoiDung2[i].uid == uidUser) {
        fullname = lsNguoiDung2[i].FullName.toString();
      }
    }
    return fullname;
  }

  void insertData(int LoaiThongBao, String NoiDung, int TrangThai, String uid1,
      String uid2) {
    ref.child("ThongBao").push().set({
      'LoaiThongBao': LoaiThongBao,
      'NoiDung': NoiDung,
      'TrangThai': TrangThai,
      'uid1': uid1,
      'uid2': uid2,
    });
  }

  void retrieveUserData() {
    ref.child("Users").onChildAdded.listen((data) {
      for (int i = 0; i < lsBanBe.length; i++) {
        if (data.snapshot.child("uid").value.toString() ==
                lsBanBe[i].NguoiDung2.toString() &&
            lsBanBe[i].NguoiDung1 == uidUser) {
          UserObject UserObject1 =
              UserObject.formJson(data.snapshot.value as Map);
          lsNguoiDung.add(UserObject1);
        }
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  void retrieveBanBeData2() {
    ref.child("Users").onChildAdded.listen((data) {
      UserObject UserObject1 = UserObject.formJson(data.snapshot.value as Map);
      lsNguoiDung2.add(UserObject1);
      if (mounted) {
        setState(() {});
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Padding(padding: EdgeInsets.all(80)),
            Text(
              'BẠN BÈ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(250, 250, 250, 250),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Colors.blue,
                child: TabBar(
                  tabs: [
                    Row(children: [
                      Icon(Icons.people),
                      SizedBox(width: 5),
                      Text("Danh sách")
                    ]),
                    Row(children: [
                      Icon(Icons.sports_esports_rounded),
                      SizedBox(width: 5),
                      Text("Thách đấu")
                    ]),
                    Row(children: [
                      Icon(Icons.person_add_alt_1_rounded),
                      SizedBox(width: 5),
                      Text("Kết bạn")
                    ]),
                  ],
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  unselectedLabelStyle:
                      TextStyle(fontStyle: FontStyle.normal, fontSize: 15),
                  indicatorColor: Colors.deepPurple,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //tab bar danh sach
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.all(3)),
                      Row(
                        children: [
                          Container(
                            color: Colors.blue,
                            height: 40,
                            width: 432,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 160, bottom: 10)),
                                    Text('Tên',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 140, bottom: 10)),
                                    Text('Trạng thái',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 400,
                        height: 380,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 1,
                        //     color: Colors.black,
                        //   ),
                        //   borderRadius: BorderRadius.all(Radius.circular(6)),
                        //   color: Colors.white12,
                        // ),
                        child: ListView.builder(
                          itemCount:
                              lsNguoiDung.length != 0 ? lsNguoiDung.length : 0,
                          itemBuilder: (context, index) => Row(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 130, bottom: 15)),
                                        Text(
                                            lsNguoiDung.length != 0
                                                ? lsNguoiDung[index]
                                                    .FullName
                                                    .toString()
                                                : '',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 140, bottom: 15)),
                                        Text(
                                            lsNguoiDung.length != 0
                                                ? 'online'
                                                : '',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 17))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 110, bottom: 15)),
                                        Text(
                                            lsNguoiDung.length != 0
                                                ? 'Xóa'
                                                : '',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Card(
                          //   child: ListTile(
                          //     // leading: CircleAvatar(
                          //     //   backgroundImage: CachedNetworkImageProvider(
                          //     //     lsBanBe[index].picture,
                          //     //   ),
                          //     // ),
                          //     title: Text(lsBanBe[index].BanBeid.toString()),
                          //     subtitle: Column(
                          //       children: [
                          //         Text(lsBanBe[index].NguoiDung1.toString()),
                          //         Text(lsBanBe[index].NguoiDung2.toString()),
                          //       ],
                          //     ),
                          //     onTap: () {
                          //       // Navigator.push(
                          //       //   context,
                          //       //   MaterialPageRoute(
                          //       //     builder: (context) =>
                          //       //         ProductDetail(product: lsContacts[index]),
                          //       //   ),
                          //       // );
                          //     },
                          //   ),
                          // ),
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
                      //               Text('Admin',
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontSize: 17,
                      //                       fontWeight: FontWeight.bold)),
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 140, bottom: 15)),
                      //               Text('online',
                      //                   style: TextStyle(
                      //                       color: Colors.green,
                      //                       fontSize: 17))
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 110, bottom: 15)),
                      //               Text('Xem thông tin chi tiết',
                      //                   style: TextStyle(
                      //                       color: Colors.blue,
                      //                       fontSize: 12,
                      //                       decoration:
                      //                           TextDecoration.underline))
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
                      //               Text('User',
                      //                   style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontSize: 17,
                      //                       fontWeight: FontWeight.bold)),
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 140, bottom: 20)),
                      //               Text('offline',
                      //                   style: TextStyle(
                      //                       color: Colors.red, fontSize: 17))
                      //             ],
                      //           ),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       right: 110, bottom: 20)),
                      //               Text('Xem thông tin chi tiết',
                      //                   style: TextStyle(
                      //                       color: Colors.blue,
                      //                       fontSize: 12,
                      //                       decoration:
                      //                           TextDecoration.underline))
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),

                  //tab bar thach dau
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Padding(padding: EdgeInsets.only(top: 10,left: 20)),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            width: 400,
                            height: 380,
                            child: ListView.builder(
                              itemCount: lsNguoiDung.length != 0
                                  ? lsNguoiDung.length
                                  : 0,
                              itemBuilder: (context, index) => Row(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 130, bottom: 15)),
                                            Text(
                                                lsNguoiDung.length != 0
                                                    ? lsNguoiDung[index]
                                                        .FullName
                                                        .toString()
                                                    : '',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 140, bottom: 15)),
                                            Text(
                                                lsNguoiDung.length != 0
                                                    ? 'online'
                                                    : '',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 17))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 100, bottom: 15),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                insertData(
                                                    1,
                                                    layFullName().toString() +
                                                        ' gửi bạn lời mời Thách đấu',
                                                    0,
                                                    uidUser,
                                                    lsNguoiDung[index]
                                                        .uid
                                                        .toString());
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Gửi lời mời thành công');
                                              },
                                              child: const Text('Thách đấu'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //tab bar ket ban
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          controller: strSearch,
                          decoration: InputDecoration(
                            labelText: 'Nhập tên người bạn muốn tìm',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                          ),
                          onChanged: (value) {
                            if (strSearch.text != null) {
                              for (int i = 0; i < lsNguoiDung2.length; i++) {
                                if (lsNguoiDung2[i]
                                    .FullName
                                    .toLowerCase()
                                    .contains(strSearch.text)) {
                                  lsTimKiem.add(lsNguoiDung2[i]);
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              }
                              for (int i = 0; i < lsNguoiDung2.length; i++) {
                                abc = 0;
                                for (int j = 0; j < lsTimKiem.length; j++) {
                                  if (lsNguoiDung2[i].uid == lsTimKiem[j].uid) {
                                    //lsTimKiem.removeAt(j);
                                    abc++;
                                  }
                                  if (abc == 2) {
                                    lsTimKiem.removeAt(j);
                                  }
                                }
                              }
                              if (mounted) {
                                setState(() {});
                              }
                            }
                            if (strSearch.text.isEmpty) {
                              lsTimKiem = [];
                              lsTimKiem.remove(true);
                              if (mounted) {
                                setState(() {});
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: Colors.white12,
                        ),
                        child: ListView.builder(
                          itemCount:
                              lsTimKiem.length != 0 ? lsTimKiem.length : 0,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              // leading: CircleAvatar(
                              //   backgroundImage: CachedNetworkImageProvider(
                              //     lsBanBe[index].picture,
                              //   ),
                              // ),
                              title: Text(lsTimKiem[index].FullName.toString()),
                              subtitle: Text(lsTimKiem[index].Email.toString()),
                              //Text(lsTimKiem[index].uid.toString()),

                              trailing: IconButton(
                                icon: Icon(Icons.add_circle),
                                // Icons.add_circle,
                                color: Colors.blue,
                                iconSize: 30,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Gửi kết bạn'),
                                          content: const Text(
                                              'Bạn có chắc sẽ gửi lời mời kết bạn cho người này?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Hủy'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                insertData(
                                                    1,
                                                    layFullName().toString() +
                                                        ' gửi bạn lời mời kết bạn',
                                                    0,
                                                    uidUser,
                                                    lsTimKiem[index]
                                                        .uid
                                                        .toString());
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Gửi lời mời thành công');
                                              },
                                              child: const Text('ok'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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


// class ChildWidget extends StatelessWidget {
//   ChildWidget({Key? key, required this.sttext}) : super(key: key);
//   String sttext;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(5),
//       child: Card(
//         elevation: 10,
//         shadowColor: Colors.blue,
//         child: ListTile(
//           leading: CircleAvatar(),
//           title: Text('$sttext     Nguyễn Đan Trường'),
//           trailing: Icon(
//             Icons.add_circle,
//             color: Colors.blue,
//             size: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }
