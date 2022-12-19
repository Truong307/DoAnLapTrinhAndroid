class ThongBaoObject {
  late int LoaiThongBao;
  late String NoiDung;
  late int TrangThai;
  late String uid1;
  late String uid2;
  late String Key;

  ThongBaoObject(
      {required this.LoaiThongBao,
      required this.NoiDung,
      required this.TrangThai,
      required this.uid1,
      required this.uid2});

  ThongBaoObject.formJson(Map<dynamic, dynamic> r)
      : LoaiThongBao = r['LoaiThongBao'],
        NoiDung = r['NoiDung'],
        TrangThai = r['TrangThai'],
        uid1 = r['uid1'],
        uid2 = r['uid2'];
}
