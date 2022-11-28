import 'package:firebase_database/firebase_database.dart';

class CauHoi {
  int? key;
  CauHoiObject? cauHoiObject;

  CauHoi({this.key, this.cauHoiObject});
}

class CauHoiObject {
  int? cauHoiId;
  String? doKho;
  int? linhVucId;
  String? tenCauHoi;

  CauHoiObject({this.cauHoiId, this.doKho, this.linhVucId, this.tenCauHoi});

  CauHoiObject.fromJson(Map<dynamic, dynamic> json) {
    cauHoiId = json['cauHoiId'];
    doKho = json['doKho'];
    linhVucId = json['linhVucId'];
    tenCauHoi = json['tenCauHoi'];
  }
}
