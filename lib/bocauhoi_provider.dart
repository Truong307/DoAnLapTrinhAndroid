import 'dart:convert';

import 'package:doan_android/dap_an_object.dart';
import 'package:doan_android/ket_qua_thach_dau.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class BoCauHoiProvider {
  static layToanBoCauHoi() async {
    final ref = FirebaseDatabase.instance.ref();
    List<BoCauHoiObject> list = [];
    await ref.child("CauHoi").onChildAdded.listen((data) {
      BoCauHoiObject boCauHoiObject =
          BoCauHoiObject.formJson(data.snapshot.value as Map);
      list.add(boCauHoiObject);
    });
    return list;
  }

  static layCauHoiLSuDe() async {
    final ref = FirebaseDatabase.instance.ref();
    List<BoCauHoiObject> lsLichSuDe = [];
    await ref.child("CauHoi").onChildAdded.listen((data) {
      if (data.snapshot.child("doKho").value.toString() == "Dễ" &&
          data.snapshot.child("linhVucId").value.toString() == "2") {
        BoCauHoiObject boCauHoiLSuDe =
            BoCauHoiObject.formJson(data.snapshot.value as Map);
        lsLichSuDe.add(boCauHoiLSuDe);
      }
    });
    return lsLichSuDe;
  }

  static layCauHoiLSuTB() async {
    final ref = FirebaseDatabase.instance.ref();
    List<BoCauHoiObject> lsLichSuTB = [];
    await ref.child("CauHoi").onChildAdded.listen((data) {
      if (data.snapshot.child("doKho").value.toString() == "Trung bình" &&
          data.snapshot.child("linhVucId").value.toString() == "2") {
        BoCauHoiObject boCauHoiLSuTB =
            BoCauHoiObject.formJson(data.snapshot.value as Map);
        lsLichSuTB.add(boCauHoiLSuTB);
      }
    });
    return lsLichSuTB;
  }

  static layCauHoiLSuKho() async {
    final ref = FirebaseDatabase.instance.ref();
    List<BoCauHoiObject> lsLichSuKho = [];
    await ref.child("CauHoi").onChildAdded.listen((data) {
      if (data.snapshot.child("doKho").value.toString() == "Khó" &&
          data.snapshot.child("linhVucId").value.toString() == "2") {
        BoCauHoiObject boCauHoiLSuKho =
            BoCauHoiObject.formJson(data.snapshot.value as Map);
        lsLichSuKho.add(boCauHoiLSuKho);
      }
    });
    return lsLichSuKho;
  }

  static layCauHoiDiaLyDe() async {
    final ref = FirebaseDatabase.instance.ref();
    List<BoCauHoiObject> lsDiaLyDe = [];
    await ref.child("CauHoi").onChildAdded.listen((data) {
      if (data.snapshot.child("doKho").value.toString() == "Dễ" &&
          data.snapshot.child("linhVucId").value.toString() == "3") {
        BoCauHoiObject boCauHoiDLyDe =
            BoCauHoiObject.formJson(data.snapshot.value as Map);
        lsDiaLyDe.add(boCauHoiDLyDe);
      }
    });
    return lsDiaLyDe;
  }

  static layCauHoiDiaLyTB() async {
    final ref = FirebaseDatabase.instance.ref();
    List<BoCauHoiObject> lsDiaLyTB = [];
    await ref.child("CauHoi").onChildAdded.listen((data) {
      if (data.snapshot.child("doKho").value.toString() == "Trung bình" &&
          data.snapshot.child("linhVucId").value.toString() == "3") {
        BoCauHoiObject boCauHoiDLyTB =
            BoCauHoiObject.formJson(data.snapshot.value as Map);
        lsDiaLyTB.add(boCauHoiDLyTB);
      }
    });
    return lsDiaLyTB;
  }

  static layCauHoiDiaLyKho() async {
    final ref = FirebaseDatabase.instance.ref();
    List<BoCauHoiObject> lsDiaLyKho = [];
    await ref.child("CauHoi").onChildAdded.listen((data) {
      if (data.snapshot.child("doKho").value.toString() == "Khó" &&
          data.snapshot.child("linhVucId").value.toString() == "3") {
        BoCauHoiObject boCauHoiDLyKho =
            BoCauHoiObject.formJson(data.snapshot.value as Map);
        lsDiaLyKho.add(boCauHoiDLyKho);
      }
    });
    return lsDiaLyKho;
  }

  static danhSachNguoiDung() async {
    final ref = FirebaseDatabase.instance.ref();
    List<UserObject> lsUsers = [];
    await ref.child("Users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.formJson(data.snapshot.value as Map);
      lsUsers.add(userObject);
    });
    return lsUsers;
  }

  static layThongTinUser() async {
    String uid = "";
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uid = user.uid;
      }
    });
    return uid;
  }

  static layKetQuaChoi() async {
    final ref = FirebaseDatabase.instance.ref();
    List<KetQuaChoiObject> ketQuaChoi = [];
    final user = ref
        .child("KetQuaChoi")
        .child(layThongTinUser().toString())
        .limitToLast(1);
    await user.onChildAdded.listen((data) {
      KetQuaChoiObject ketQuaChoiObject =
          KetQuaChoiObject.fromJson(data.snapshot.value as Map);
      ketQuaChoi.add(ketQuaChoiObject);
    });
    return ketQuaChoi;
  }

  static layAllKetQuaChoi() async {
    final ref = FirebaseDatabase.instance.ref();
    List<KetQuaChoiObject> ketQuaChoi = [];
    final user = ref.child("KetQuaChoi").child("${layThongTinUser()}");
    await user.onChildAdded.listen((data) {
      KetQuaChoiObject ketQuaChoiObject =
          KetQuaChoiObject.fromJson(data.snapshot.value as Map);
      ketQuaChoi.add(ketQuaChoiObject);
    });
    return ketQuaChoi;
  }
}
