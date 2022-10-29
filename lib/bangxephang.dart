import 'package:flutter/material.dart';

class bangXepHangStateLess extends StatefulWidget {
  @override
  State<bangXepHangStateLess> createState() => _bangXepHangState();
}

class _bangXepHangState extends State<bangXepHangStateLess>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController2;

  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    _tabController2 = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          unselectedLabelStyle:
              TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController2,
                children: <Widget>[
                  //tabbar BXH TẤT CẢ
                  Container(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(3)),
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 500,
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
                                              right: 160, bottom: 20)),
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
                                              right: 180, bottom: 20)),
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
                                              right: 140, bottom: 20)),
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
                                              right: 160, bottom: 15)),
                                      Text('1',
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 180, bottom: 15)),
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
                                              right: 130, bottom: 15)),
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
                                              right: 160, bottom: 20)),
                                      Text('2',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 180, bottom: 20)),
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
                                              right: 130, bottom: 20)),
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
                                              right: 160, bottom: 20)),
                                      Text('3',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 190, 123, 22),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 180, bottom: 20)),
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
                                              right: 130, bottom: 20)),
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
                                      Text('4',
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
                                      Text('Bạn',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 17))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 130, bottom: 20)),
                                      Text(
                                        '6666',
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
                                              right: 160, bottom: 20)),
                                      Text('5',
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
                                      Text('Không có tên',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 130, bottom: 20)),
                                      Text(
                                        '5555',
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
                      ],
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
                                        width: 500,
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
                                                        right: 180,
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
                                                        right: 140,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                        width: 500,
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
                                                        right: 180,
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
                                                        right: 140,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                        width: 500,
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
                                                        right: 180,
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
                                                        right: 140,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                        width: 500,
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
                                                        right: 180,
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
                                                        right: 140,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                        width: 500,
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
                                                        right: 180,
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
                                                        right: 140,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                        width: 500,
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
                                                        right: 180,
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
                                                        right: 140,
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
                                                        right: 180,
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
                                                        right: 180,
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
                                                        right: 180,
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
                          Container(
                            height: 60,
                            width: 500,
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
                                            right: 160, bottom: 20)),
                                    Text('Thứ hạng',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 180, bottom: 20)),
                                    Text('Tên',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 140, bottom: 20)),
                                    Text('Điểm',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17))
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
                                    Text('1',
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 180, bottom: 15)),
                                    Text('Nguyễn Văn A',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 130, bottom: 15)),
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
                                            right: 160, bottom: 20)),
                                    Text('2',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 180, bottom: 20)),
                                    Text('Trần Thị B',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 130, bottom: 20)),
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
                                            right: 160, bottom: 20)),
                                    Text('3',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 190, 123, 22),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 180, bottom: 20)),
                                    Text('Lê B D',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 130, bottom: 20)),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
