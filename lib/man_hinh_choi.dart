

import 'package:doan_android/dang_nhap.dart';
import 'package:flutter/material.dart';

void main(){}

class playScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: IconButton(
              splashRadius: 24,
              tooltip: 'Trở về',
              //Xử trở về trang chủ
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
        ],
      ),
    ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: FloatingActionButton(
                  onPressed: (){}, 
                  child: Text('50:50'),
                ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: FloatingActionButton(
                  onPressed: (){}, 
                  child: Text('mua'),
                ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.alarm),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    ': 60s',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                ),
            ],
          ),
          Container(
            height: 400,
            width: 450,
            //color: Colors.blue,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: null,
              borderRadius: BorderRadius.all(Radius.circular(20)), 
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 205, 74),
              border: null,
              borderRadius: BorderRadius.all(Radius.circular(20)), 
            ),
                  
                  child: Center(
                    child: Text(
                    '1000',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 300,
                  width: 300,
                  child: Text(
                  'Câu 1: Bạn hãy cho biết 1+1=?',
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Container(
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(200, 100),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                            ),
                        ),
                        onPressed: (){},
                        child: Text('A. -1',
                        ),
                      ),
                      ),
                      Container(
                        child: ElevatedButton(
                          
                        style: ElevatedButton.styleFrom(
                          //backgroundColor: Colors.red,
                          minimumSize: Size(200, 100),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                            ),
                        ),
                        onPressed: (){},
                        child: Text('B. 0',
                        ),
                      ),
                      ),
                  ],
                ),
                Container(
                  //điều chỉnh khoảng cách 2 row
                  height: 30,
                  width: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Container(
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 100),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                            ),
                        ),
                        onPressed: (){},
                        child: Text('C. 2002',
                        ),
                      ),
                      ),
                      Container(
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(200, 100),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                            ),
                        ),
                        onPressed: (){},
                        child: Text('D. 2',
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
    );
  }

}