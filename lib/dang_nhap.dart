import 'package:doan_android/quen_mat_khau.dart';
import 'package:doan_android/dang_ky.dart';
import 'package:doan_android/trangchu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Đăng Nhập'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "Đăng Nhập",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),*/
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Row(
          //       //padding: EdgeInsets.only(right: 280),
          //       // children: Text("Tài khoản",
          //       // style: TextStyle(
          //       //   fontSize: 18,
          //       //   fontWeight: FontWeight.w700,
          //       // ),
          //       // ),
          //       children: [
          //         Container(
          //           padding: EdgeInsets.only(left: 15),
          //           child: const Text(
          //             "Tài khoản",
          //             style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.w700,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(15),
          //       child: TextField(
          //         controller: str1,
          //         decoration: const InputDecoration(
          //           //hintText: 'Nhập Tài Khoản',
          //           border: OutlineInputBorder(),
          //           prefixIcon: Icon(Icons.person),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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
                    child: const Text(
                      "Email",
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
                  controller: txtEmail,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  "Mật Khẩu",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: txtPass,
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
              onPressed: () async {
                try {
                  final _user = _auth.signInWithEmailAndPassword(
                      email: txtEmail.text, password: txtPass.text);
                  _auth.authStateChanges().listen((event) {
                    if (event != null) {
                      txtEmail.clear();
                      txtPass.clear();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'home',
                        (route) => false,
                      );
                    } else {
                      final snackBar = SnackBar(
                          content: Text('Email hoặc Mật Khẩu Không Đúng'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                } catch (e) {
                  final snackBar =
                      SnackBar(content: Text('Lỗi Kết Nối Đến Server'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text(
                'Đăng Nhập',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    }, //Bổ sung 3
                    child: const Text(
                      'Quên Mật Khẩu?',
                      style: TextStyle(
                        //decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      ).then((value) {
                        if (value != null) {
                          final snackBar = SnackBar(
                            content: Text(value),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    }, //Bổ sung 3
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        //decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 15,
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
