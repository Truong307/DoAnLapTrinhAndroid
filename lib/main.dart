import 'package:doan_android/bangxephang.dart';
import 'package:doan_android/canhan.dart';
import 'package:doan_android/choingay.dart';
import 'package:doan_android/dang_ky.dart';
import 'package:doan_android/dang_nhap.dart';
import 'package:doan_android/doi_mat_khau.dart';
import 'package:doan_android/ket_qua_thach_dau.dart';
import 'package:doan_android/man_hinh_choi.dart';
import 'package:doan_android/nhap_ma_xac_nhan.dart';
import 'package:doan_android/quen_mat_khau.dart';
import 'package:doan_android/choithachdau.dart';
import 'package:doan_android/trangchu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CKC Quizz',
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? 'welcome' : 'home',
      routes: {
        'welcome': (context) => LoginScreen(),
        'home': (context) => TrangChu(),
      },
    );
  }
}
