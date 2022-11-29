import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/quen_mat_khau.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        title: const Text('Đăng Ký'),
        centerTitle: true,
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "Đăng Ký",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),*/
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(left: 15),
          //       child: Text(
          //         "Tài khoản:",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(15),
          //       child: const TextField(
          //         keyboardType: TextInputType.emailAddress,
          //         decoration: InputDecoration(
          //           //labelText: 'Tài khoản',
          //           border: OutlineInputBorder(),
          //           prefixIcon: Icon(Icons.person),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  "Email:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    //labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
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
                  "Mật khẩu:",
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
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    //labelText: 'Mật khẩu',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(
          //         left: 15,
          //       ),
          //       child: Text(
          //         "Xác nhận mật khẩu:",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(15),
          //       child: const TextField(
          //         obscureText: true,
          //         decoration: InputDecoration(
          //           //labelText: 'Xác nhận mật khẩu',
          //           border: OutlineInputBorder(),
          //           prefixIcon: Icon(Icons.password),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(
          //         left: 15,
          //       ),
          //       child: Text(
          //         "Số điện thoại:",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(15),
          //       child: const TextField(

          //         decoration: InputDecoration(
          //           //labelText: 'Số điện thoại',
          //           border: OutlineInputBorder(),
          //           prefixIcon: Icon(Icons.phone),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(
          //         left: 15,
          //       ),
          //       child: Text(
          //         "Tên người dùng:",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(15),
          //       child: const TextField(
          //         obscureText: true,
          //         decoration: InputDecoration(
          //           //labelText: 'Tên người dùng',
          //           border: OutlineInputBorder(),
          //           prefixIcon: Icon(Icons.person),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            //padding: const EdgeInsets.all(15), // Bổ sung thêm 1
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //padding: const EdgeInsets.all(20),
                minimumSize: Size(140, 60),
              ),
              onPressed: () async {
                try {
                  final newUser = _auth.createUserWithEmailAndPassword(
                      email: txtEmail.text, password: txtPass.text);
                  if (newUser != null) {
                    Navigator.pop(context, 'Đăng Ký Thành Công!');
                  } else {
                    final snackBar =
                        SnackBar(content: Text('Tài Khoản Này Không Hợp Lệ'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (e) {
                  final snackBar = SnackBar(content: Text('Có Lỗi Xảy Ra!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }, // Bổ sung thêm 1
              child: const Text(
                'Đăng Ký',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              }, //Bổ sung 5
              child: const Text(
                'Quên Mật Khẩu',
                style: TextStyle(
                  //decoration: TextDecoration.underline,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
