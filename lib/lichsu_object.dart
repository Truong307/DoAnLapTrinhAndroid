class LichSuObject1 {
  late int Diem;
  late String DoKho;
  late String LinhVuc;
  late String SoDapAnDung;
  late String Ten;
  late String Uid;

  LichSuObject1({
    required this.Diem,
    required this.DoKho,
    required this.LinhVuc,
    required this.SoDapAnDung,
    required this.Ten,
    required this.Uid,
  });

  LichSuObject1.fromJson(Map<dynamic, dynamic> r)
      : Diem = r['Diem'],
        DoKho = r['DoKho'],
        LinhVuc = r['LinhVuc'],
        SoDapAnDung = r['SoDapAnDung'],
        Ten = r['Ten'],
        Uid = r['Uid'];
}
