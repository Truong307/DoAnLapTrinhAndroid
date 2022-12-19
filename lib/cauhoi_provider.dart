import 'package:doan_android/cauhoi_object.dart';
import 'package:firebase_database/firebase_database.dart';

class CauHoiProvider {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  List<CauHoi> lsCauHoi = [];
  List<CauHoi> lsCauHoiDLyDe = [];
  List<CauHoi> lsCauHoiDLyTB = [];
  List<CauHoi> lsCauHoiDLyKho = [];
  List<CauHoi> lsCauHoiLSuDe = [];
  List<CauHoi> lsCauHoiLSuTB = [];
  List<CauHoi> lsCauHoiLSuKho = [];

  void retrieveCauHoiData() {
    ref.child("CauHoi").onChildAdded.listen((data) {
      CauHoiObject cauHoiObject =
          CauHoiObject.fromJson(data.snapshot.value as Map);
      CauHoi cauHoi =
          CauHoi(key: data.snapshot.key.hashCode, cauHoiObject: cauHoiObject);
      lsCauHoi.add(cauHoi);
    });
  }

  void _cauHoiDiaLyDe() {
    CauHoi diaLyDe;
    for (int i = 0; i < lsCauHoi.length; i++) {
      if (lsCauHoi[i].cauHoiObject!.linhVucId.toString() == "2" &&
          lsCauHoi[i].cauHoiObject!.doKho.toString() == "Dễ") {
        diaLyDe = lsCauHoi[i];
        lsCauHoiDLyDe.add(diaLyDe);
      }
    }
  }

  CauHoiProvider(this.lsCauHoiDLyDe);
}
