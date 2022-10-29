import 'package:flutter/material.dart';

class banBe_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Row(
                children: [
                  Container(
                    child: IconButton(
                      splashRadius: 24,
                      tooltip: 'Trở về',
                      onPressed: () {},
                      //========================//
                      icon: Image.asset('images/undo.png'),
                      iconSize: 40,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(70)),
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
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    unselectedLabelStyle:
                        TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
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
                              width: 500,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 160, bottom: 10)),
                                      Text('Tên',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 180, bottom: 10)),
                                      Text('Trạng thái',
                                          style: TextStyle(
                                              color: Colors.white,
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
                                              right: 160, bottom: 15)),
                                      Text('Admin',
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
                                              right: 180, bottom: 15)),
                                      Text('online',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 17))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 130, bottom: 15)),
                                      Text('Xem thông tin chi tiết',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.underline))
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
                                              right: 160, bottom: 20)),
                                      Text('User',
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
                                              right: 180, bottom: 20)),
                                      Text('offline',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 17))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 130, bottom: 20)),
                                      Text('Xem thông tin chi tiết',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.underline))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //tab bar thach dau
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.all(2)),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 160, bottom: 15)),
                                      Text('Admin',
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
                                              right: 180, bottom: 15)),
                                      Text('online',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 17))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 15, top: 20),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Thách đấu'),
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
                                              right: 160, bottom: 20)),
                                      Text('TrauNui',
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
                                              right: 180, bottom: 20)),
                                      Text('online',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 17))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 15, top: 20),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Thách đấu'),
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
                                              right: 160, bottom: 20)),
                                      Text('Lelouch',
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
                                              right: 180, bottom: 20)),
                                      Text('online',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 17))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 15, top: 20),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Thách đấu'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                            decoration: InputDecoration(
                              labelText: 'Nhập tên người bạn muốn tìm',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.search)),
                            ),
                          ),
                        ),
                        Container(
                          width: 470,
                          height: 500,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: Colors.white12,
                          ),
                          child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return ChildWidget(sttext: index.toString());
                            },
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
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  ChildWidget({Key? key, required this.sttext}) : super(key: key);
  String sttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 10,
        shadowColor: Colors.blue,
        child: ListTile(
          leading: CircleAvatar(),
          title: Text('$sttext     Nguyễn Đan Trường'),
          trailing: Icon(
            Icons.add_circle,
            color: Colors.blue,
            size: 30,
          ),
        ),
      ),
    );
  }
}
