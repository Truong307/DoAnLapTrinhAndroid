class BanBeObject {
  late String? NguoiDung1;
  late String? NguoiDung2;
  late String Key;

  BanBeObject({required this.NguoiDung1, required this.NguoiDung2});

  BanBeObject.formJson(Map<dynamic, dynamic> r)
      : NguoiDung1 = r['NguoiDung1'],
        NguoiDung2 = r['NguoiDung2'];
}
