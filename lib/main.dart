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
import 'package:doan_android/test.dart';
import 'package:doan_android/trangchu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
