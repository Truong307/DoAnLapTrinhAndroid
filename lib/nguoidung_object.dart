class UserObject {
  late String uid;
  late String FullName;
  late String Email;
  late String Password;
  late String Phone;
  late String Sex;
  late String Age;

  UserObject({
    required this.uid,
    required this.FullName,
    required this.Email,
    required this.Password,
    required this.Phone,
    required this.Sex,
    required this.Age,
  });
  UserObject.formJson(Map<dynamic, dynamic> r)
      : uid = r['uid'],
        FullName = r['FullName'],
        Email = r['Email'],
        Password = r['Password'],
        Phone = r['Phone'],
        Sex = r['Sex'],
        Age = r['Age'];
}

class KetQuaChoiObject {
  int? diem;
  String? doKho;
  String? linhVuc;
  String? soDapAnDung;
  String? ten;
  String? thoiGian;

  KetQuaChoiObject(
      {this.diem,
      this.doKho,
      this.linhVuc,
      this.soDapAnDung,
      this.ten,
      this.thoiGian});

  KetQuaChoiObject.fromJson(Map<dynamic, dynamic> r)
      : diem = r['Diem'],
        doKho = r['DoKho'],
        linhVuc = r['LinhVuc'],
        soDapAnDung = r['SoDapAnDung'],
        ten = r['Ten'],
        thoiGian = r['ThoiGian'];
}

class LichSuObject {
  int? diem;
  String? doKho;
  String? linhVuc;
  String? soDapAnDung;
  String? ten;
  String? thoiGian;
  String? uid;

  LichSuObject(
      {this.diem,
      this.doKho,
      this.linhVuc,
      this.soDapAnDung,
      this.ten,
      this.thoiGian,
      this.uid});

  LichSuObject.fromJson(Map<dynamic, dynamic> r)
      : diem = r['Diem'],
        doKho = r['DoKho'],
        linhVuc = r['LinhVuc'],
        soDapAnDung = r['SoDapAnDung'],
        ten = r['Ten'],
        thoiGian = r['ThoiGian'],
        uid = r['Uid'];
}

// class UserObject {
//   late String uid;
//   late String FullName;
//   late String Email;
//   // late String profileImage;
//   // late int dt;

//   UserObject({
//     required this.uid,
//     required this.FullName,
//     required this.Email,
//   });

//   static UserObject fromMap(Map<String, dynamic> map) {
//     return UserObject(
//       uid: map['uid'],
//       FullName: map['FullName'],
//       Email: map['email'],
//       // profileImage: map['profileImage'],
//       // dt: map['dt'],
//     );
//   }
// }