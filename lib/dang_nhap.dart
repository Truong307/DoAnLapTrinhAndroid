
import 'package:doan_android/quen_mat_khau.dart';
import 'package:doan_android/dang_ky.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController str1 = TextEditingController();
  TextEditingController str2 = TextEditingController();
  String s1 = 'admin';
  String s2 = '12345';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Nhập'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "Đăng Nhập",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                //padding: EdgeInsets.only(right: 280),
                // children: Text("Tài khoản",
                // style: TextStyle(
                //   fontSize: 18,
                //   fontWeight: FontWeight.w700,
                // ),
                // ),
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: const Text("Tài khoản",
                  style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w700,
                 ),
                 ),
                  ),
                ],
              ),
              Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: str1,
              decoration: const InputDecoration(
                //hintText: 'Nhập Tài Khoản',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(right: 380),
                child: Text("Mật Khẩu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                ),
              ),
              Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: str2,
              obscureText: true,
              decoration: const InputDecoration(
                //hintText: 'Nhập Mật Khẩu',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
            ),
          ),
            ],
          ),
          
          Container(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //padding: const EdgeInsets.all(20),
                minimumSize: Size(100, 60),
              ),
              onPressed: () {
                if (str1.text.isEmpty && str2.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Đăng Nhập'),
                          content:
                              const Text('Bạn chưa nhập Username, Password'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        );
                      });
                } else if (str1.text == s1 && str2.text == s2) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Đăng Nhập'),
                          content: const Text(
                              'Chúc mừng bạn đã đăng nhập thành công'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        );
                      });
                } else if (str1.text != s1 && str2.text == s2) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Đăng Nhập'),
                          content: const Text('Bạn nhập Username chưa đúng'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        );
                      });
                } else if (str1.text == s1 && str2.text != s2) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Đăng Nhập'),
                          content: const Text('Bạn nhập Password chưa đúng'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        );
                      });
                } else if (str1.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Đăng Nhập'),
                          content: const Text('Bạn chưa nhập Username'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        );
                      });
                } else if (str2.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Đăng Nhập'),
                          content: const Text('Bạn chưa nhập Password'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'))
                          ],
                        );
                      });
                }
              }, //Bổ sung 2
              child: const Text('Đăng Nhập',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  }, //Bổ sung 3
                  child: const Text(
                    'Quên Mật Khẩu',
                    style: TextStyle(
                      //decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ),
                ),
                
                Container(
                  margin: const EdgeInsets.all(30),
                  child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Register()));
                  }, //Bổ sung 3
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                      //decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
