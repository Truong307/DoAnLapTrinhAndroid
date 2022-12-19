import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/quen_mat_khau.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final ref = FirebaseDatabase.instance.ref().child('Users');
  TextEditingController fullName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Tên người dùng:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: fullName,
                  decoration: InputDecoration(
                    //labelText: 'Tài khoản',
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
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    //labelText: 'Mật khẩu',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
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
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    //labelText: 'Xác nhận mật khẩu',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
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
                  "Xác nhận mật khẩu:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: confirmPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    //labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(140, 60),
              ),
              onPressed: () async {
                if (fullName.text.isEmpty ||
                    email.text.isEmpty ||
                    password.text.isEmpty ||
                    confirmPass.text.isEmpty) {
                  // show error toast

                  Fluttertoast.showToast(msg: 'Vui lòng nhập đầy đủ thông tin');
                  return;
                }

                if (password.text.length < 6) {
                  // show error toast
                  Fluttertoast.showToast(
                      msg: 'Mật khẩu phải có ít nhất 6 ký tự');

                  return;
                }

                if (password.text != confirmPass.text) {
                  // show error toast
                  Fluttertoast.showToast(msg: 'Mật khẩu xác nhận không khớp');

                  return;
                }

                //request to firebase auth

                ProgressDialog progressDialog = ProgressDialog(
                  context,
                  title: const Text('Đang đăng ký'),
                  message: const Text('Làm ơn chờ một chút!'),
                );

                progressDialog.show();
                try {
                  FirebaseAuth auth = FirebaseAuth.instance;

                  UserCredential userCredential =
                      await auth.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);

                  if (userCredential.user != null) {
                    //store user information in Realtime database

                    String uid = userCredential.user!.uid;
                    // int dt = DateTime.now().millisecondsSinceEpoch;

                    // userRef.child('User').push().set({
                    //   'fullName': fullName.toString(),
                    //   'email': email.toString(),
                    //   // 'uid': uid,
                    //   // 'dt': dt,
                    // });
                    ref.child(uid).set({
                      'FullName': fullName.text,
                      'Password': password.text,
                      'Email': email.text,
                      'uid': uid,
                      'Phone': 'Chưa cập nhật',
                      'Sex': 'Chưa cập nhật',
                      'Age': 'Chưa cập nhật',
                    });
                    if (mounted) {
                      setState(() {});
                    }

                    Fluttertoast.showToast(msg: 'Đăng ký thành công');

                    Navigator.of(context).pop();
                  } else {
                    Fluttertoast.showToast(msg: 'Đăng ký thất bại');
                  }

                  progressDialog.dismiss();
                } on FirebaseAuthException catch (e) {
                  progressDialog.dismiss();
                  if (e.code == 'email-already-in-use') {
                    Fluttertoast.showToast(msg: 'Email đã tồn tại');
                  } else if (e.code == 'weak-password') {
                    Fluttertoast.showToast(msg: 'Mật khẩu yếu');
                  }
                } catch (e) {
                  progressDialog.dismiss();
                  Fluttertoast.showToast(msg: 'Đã xảy ra sự cố');
                }
              },
              child: const Text(
                'Đăng Ký',
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
                          builder: (context) => LoginScreen(),
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
                      'Đăng nhập',
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

// ref.child("User").push().set({
//                   'Tài Khoản': taiKhoan.text,
//                   'Mật khẩu': mauKhau.text,
//                   'SDT': SDT.text,
//                   'Email': email.text,
//                   'Tên nguoif dùng': tenUser.text
//                 });
