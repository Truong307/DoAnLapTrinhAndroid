import 'package:doan_android/cauhoi_object.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class BoCauHoi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BoCauHoiState();
  }
}

class BoCauHoiState extends State<BoCauHoi> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  List<CauHoi> lsCauHoi = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Truy xuất dữ liệu Câu Hỏi
    retrieveCauHoiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bộ Câu Hỏi'),
      ),
      body: Container(
        child: Column(
          children: [
            _cauHoiWidget(),
          ],
        ),
      ),
    );
  }

  void retrieveCauHoiData() {
    ref.child("CauHoi").onChildAdded.listen((data) {
      CauHoiObject cauHoiObject =
          CauHoiObject.fromJson(data.snapshot.value as Map);
      CauHoi cauHoi =
          CauHoi(key: data.snapshot.key.hashCode, cauHoiObject: cauHoiObject);
      lsCauHoi.add(cauHoi);
      setState(() {});
    });
  }

  Widget _cauHoiWidget() {
    for (int i = 0; i < lsCauHoi.length; i++) {
      return Container(
        child: Column(
          children: [
            Text(
              lsCauHoi[i].cauHoiObject!.tenCauHoi.toString(),
            ),
          ],
        ),
      );
    }
    return Container(
      child: Text('Null'),
    );
  }
}
