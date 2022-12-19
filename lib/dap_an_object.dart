class BoCauHoiObject {
  int? cauHoiId;
  String? dapAnA;
  String? dapAnB;
  String? dapAnC;
  String? dapAnD;
  String? dapAnDung;
  String? doKho;
  int? linhVucId;
  String? tenCauHoi;

  BoCauHoiObject(
      {this.cauHoiId,
      this.dapAnA,
      this.dapAnB,
      this.dapAnC,
      this.dapAnD,
      this.dapAnDung,
      this.doKho,
      this.linhVucId,
      this.tenCauHoi});

  BoCauHoiObject.formJson(Map<dynamic, dynamic> r)
      : cauHoiId = r['cauHoiId'],
        dapAnA = r['dapAnA'],
        dapAnB = r['dapAnB'],
        dapAnC = r['dapAnC'],
        dapAnD = r['dapAnD'],
        dapAnDung = r['dapAnDung'],
        doKho = r['doKho'],
        linhVucId = r['linhVucId'],
        tenCauHoi = r['tenCauHoi'];
}

class ChiTietLichSu {
  String? danAnChon;
  String? dapAnA;
  String? dapAnB;
  String? dapAnC;
  String? dapAnD;
  String? dapAnDung;
  String? doKho;
  int? linhVucId;
  String? tenCauHoi;

  ChiTietLichSu(
      {this.danAnChon,
      this.dapAnA,
      this.dapAnB,
      this.dapAnC,
      this.dapAnD,
      this.dapAnDung,
      this.doKho,
      this.linhVucId,
      this.tenCauHoi});

  ChiTietLichSu.formJson(Map<dynamic, dynamic> r)
      : danAnChon = r['danAnChon'],
        dapAnA = r['dapAnA'],
        dapAnB = r['dapAnB'],
        dapAnC = r['dapAnC'],
        dapAnD = r['dapAnD'],
        dapAnDung = r['dapAnDung'],
        doKho = r['doKho'],
        linhVucId = r['linhVucId'],
        tenCauHoi = r['tenCauHoi'];
}
