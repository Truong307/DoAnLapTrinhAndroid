import 'dart:async';
import 'dart:math';
import 'package:doan_android/choingay.dart';
import 'package:doan_android/dap_an_object.dart';
import 'package:doan_android/ketqua.dart';
import 'package:doan_android/nguoidung_object.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';

class ChoiCaNhan extends StatefulWidget {
  List<BoCauHoiObject> list;
  UserObject User;

  ChoiCaNhan({Key? key, required this.list, required this.User})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChoiCaNhanState();
  }
}

class ChoiCaNhanState extends State<ChoiCaNhan> {
  final ref = FirebaseDatabase.instance.ref();
  List<ChiTietLichSu> lsChiTiet = [];
  List<ChiTietLichSu> lsInsertData = [];
  List<String> lsChiTietDapAn = [];

  bool isKiemTraA = false;
  bool isKiemTraB = false;
  bool isKiemTraC = false;
  bool isKiemTraD = false;

  bool isKT = false;

  bool isKTMuaDA = false;
  bool isLuotMuaDA = true;
  bool isButton = false;
  bool macDinhA = false;
  bool macDinhB = false;
  bool macDinhC = false;
  bool macDinhD = false;
  int time = 30;
  int next = 2;
  int i = 0;
  int diem = 0;
  int demCauDung = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _thoiGianChoi();
  }

  void _tangI() {
    if (i == 9) {
      _LuuKetQua();
    }
    setState(() {
      if (i < 9) {
        i++;
      }
      macDinhA = false;
      macDinhB = false;
      macDinhC = false;
      macDinhD = false;
    });
  }

  String thoiGian = DateFormat('kk:mm dd/MM/yyyy').format(DateTime.now());

  void _LuuKetQua() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ketQua_Screen(
          user: widget.User,
        ),
      ),
    );
    _ketQuaChoi(
      diem,
      widget.User.FullName.toString(),
      widget.list[i].doKho.toString(),
      widget.list[i].linhVucId == 2 ? "Lịch Sử" : "Địa Lý",
      demCauDung.toString(),
      thoiGian,
    );
    _LichSuChoi(
      diem,
      widget.User.FullName.toString(),
      widget.list[i].doKho.toString(),
      widget.list[i].linhVucId == 2 ? "Lịch Sử" : "Địa Lý",
      demCauDung.toString(),
      thoiGian,
      widget.User.uid,
    );
    isKT = true;
    return;
  }

//========================================================================

  void _thoiGianChoi() {
    Timer.periodic(Duration(seconds: 1), (timersss) {
      if (time > 0) {
        setState(() {
          time--;
        });
      } else if (time == 30) {
        setState(() {
          time--;
        });
      } else if (isKT) {
        timersss.cancel();
      } else {
        timersss.cancel();
        _tangI();
        time = 30;
        _thoiGianChoi();
      }
    });
  }

  void hienDapAnDung() {
    Timer.periodic(Duration(milliseconds: 500), (timers) {
      if (next > 0) {
        setState(() {
          next--;
        });
      } else {
        timers.cancel();
        stop();
      }
    });
  }

  void stop() {
    setState(() {
      i++;
      macDinhA = false;
      macDinhB = false;
      macDinhC = false;
      macDinhD = false;
      isButton = false;
    });
  }

  muaDapAn() {
    if (widget.list[i].dapAnA == widget.list[i].dapAnDung) {
      diem -= 50;
      setState(() {
        macDinhA = true;
        isKiemTraA = true;
      });
    }
    if (widget.list[i].dapAnB == widget.list[i].dapAnDung) {
      diem -= 50;
      setState(() {
        macDinhB = true;
        isKiemTraB = true;
      });
    }
    if (widget.list[i].dapAnC == widget.list[i].dapAnDung) {
      diem -= 50;
      setState(() {
        macDinhC = true;
        isKiemTraC = true;
      });
    }
    if (widget.list[i].dapAnD == widget.list[i].dapAnDung) {
      diem -= 50;
      setState(() {
        macDinhD = true;
        isKiemTraD = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
//=======================================================//
    Widget backButton = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              splashRadius: 24,
              tooltip: 'Trở về',
              //Xử trở về trang chủ
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Bạn có chắc chắn muốn thoát?'),
                        content: Text('Số điểm hiện tại sẽ không được lưu'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChoiNgay()));
                            },
                            child: Text('Thoát'),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Hủy',
                            ),
                          ),
                        ],
                      );
                    });
              },
              //========================//
              icon: Image.asset('images/undo.png'),
              iconSize: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  '${widget.User.FullName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              CircleAvatar(
                child: Image.asset("images/user1.png"),
              ),
            ],
          ),
        ],
      ),
    );
//=========================================================//
    Widget cauHoiSection = Container(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          'Câu ${i + 1}: ${widget.list[i].tenCauHoi}',
          style: TextStyle(
            color: Color.fromARGB(250, 250, 250, 250),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
//========================================================//
    Widget contentSection = Container(
      width: double.infinity,
      height: 400,
      margin: EdgeInsets.only(
        top: 25,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: cauHoiSection,
    );
//=========================================================//
    Widget diemSection = Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 30,
            right: 30,
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Text(
            '$diem',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
//=========================================================//
    Widget goiYSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '50:50',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: TextButton(
              onPressed: () {
                if (isLuotMuaDA) {
                  if (diem >= 50) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Bạn có muốn mua đáp án câu hỏi này',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Hủy'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  muaDapAn();
                                  isKTMuaDA = true;
                                  isLuotMuaDA = false;
                                  Navigator.pop(context);
                                },
                                child: Text('Mua'),
                              ),
                            ],
                          );
                        });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Bạn chưa đủ điểm để mua đáp án!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Bạn đã hết lượt mua đáp án',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                'Mua',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
//=========================================================//
    Widget timeSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Icon(
              Icons.alarm_outlined,
              size: 35,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 2,
              bottom: 5,
              right: 20,
              top: 10,
            ),
            child: Text(
              time.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
//=========================================================//
    Widget dapAnSection = Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: macDinhA
                      ? isKiemTraA
                          ? Colors.green
                          : Colors.red
                      : Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(200, 90),
                    maximumSize: Size(200, 90),
                  ),
                  onPressed: isButton
                      ? null
                      : () {
                          lsChiTietDapAn.add(widget.list[i].dapAnA.toString());
                          ProgressDialog progressDialog = ProgressDialog(
                            context,
                            title: const Text('Đang lấy dữ liệu'),
                            message: const Text('Làm ơn chờ một chút!'),
                          );
                          setState(() {
                            macDinhA = true;
                            isButton = true;
                          });
                          if (widget.list[i].dapAnA ==
                              widget.list[i].dapAnDung) {
                            if (isKTMuaDA) {
                              diem += 20;
                              demCauDung += 1;
                              isKTMuaDA = false;
                            } else {
                              setState(() {
                                isKiemTraA = true;
                                diem += 50;
                                demCauDung += 1;
                              });
                            }
                          } else {
                            setState(() {
                              isKiemTraA = false;
                              diem += 0;
                              demCauDung += 0;
                            });
                          }
                          if (i == 9) {
                            int random = Random().nextInt(100000);
                            progressDialog.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ketQua_Screen(
                                  user: widget.User,
                                ),
                              ),
                            );
                            _ketQuaChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                            );
                            _LichSuChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                              widget.User.uid,
                            );
                            _ChiTietLichSuChoi(
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              widget.list[i].doKho.toString(),
                              random,
                            );
                          } else {
                            hienDapAnDung();
                            time = 30;
                          }
                        }, // Chưa xử lý
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      'A. ${widget.list[i].dapAnA}',
                      softWrap: true,
                      style: TextStyle(
                        color: Color.fromARGB(250, 250, 250, 250),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: macDinhB
                      ? isKiemTraB
                          ? Colors.green
                          : Colors.red
                      : Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(200, 90),
                    maximumSize: Size(200, 90),
                  ),
                  onPressed: isButton
                      ? null
                      : () {
                          lsChiTietDapAn.add(widget.list[i].dapAnB.toString());
                          ProgressDialog progressDialog = ProgressDialog(
                            context,
                            title: const Text('Đang lấy dữ liệu'),
                            message: const Text('Làm ơn chờ một chút!'),
                          );
                          setState(() {
                            macDinhB = true;
                            isButton = true;
                          });
                          if (widget.list[i].dapAnB ==
                              widget.list[i].dapAnDung) {
                            if (isKTMuaDA) {
                              diem += 20;
                              demCauDung += 1;
                              isKTMuaDA = false;
                            } else {
                              setState(() {
                                isKiemTraB = true;
                                diem += 50;
                                demCauDung += 1;
                              });
                            }
                          } else {
                            setState(() {
                              isKiemTraB = false;
                              diem += 0;
                              demCauDung += 0;
                            });
                          }
                          if (i == 9) {
                            int random = Random().nextInt(100000);
                            progressDialog.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ketQua_Screen(
                                  user: widget.User,
                                ),
                              ),
                            );
                            _ketQuaChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                            );
                            _LichSuChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                              widget.User.uid,
                            );
                            _ChiTietLichSuChoi(
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              widget.list[i].doKho.toString(),
                              random,
                            );
                            isKT = true;
                          } else {
                            hienDapAnDung();
                            time = 30;
                          }
                        }, // Chưa xử lý
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      'B. ${widget.list[i].dapAnB}',
                      softWrap: true,
                      style: TextStyle(
                        color: Color.fromARGB(250, 250, 250, 250),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: macDinhC
                      ? isKiemTraC
                          ? Colors.green
                          : Colors.red
                      : Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(200, 90),
                    maximumSize: Size(200, 90),
                  ),
                  onPressed: isButton
                      ? null
                      : () {
                          lsChiTietDapAn.add(widget.list[i].dapAnC.toString());
                          ProgressDialog progressDialog = ProgressDialog(
                            context,
                            title: const Text('Đang lấy dữ liệu'),
                            message: const Text('Làm ơn chờ một chút!'),
                          );
                          setState(() {
                            macDinhC = true;
                            isButton = true;
                          });
                          if (widget.list[i].dapAnC ==
                              widget.list[i].dapAnDung) {
                            if (isKTMuaDA) {
                              diem += 20;
                              demCauDung += 1;
                              isKTMuaDA = false;
                            } else {
                              setState(() {
                                isKiemTraC = true;
                                diem += 50;
                                demCauDung += 1;
                              });
                            }
                          } else {
                            setState(() {
                              isKiemTraC = false;
                              diem += 0;
                              demCauDung += 0;
                            });
                          }
                          if (i == 9) {
                            int random = Random().nextInt(100000);
                            progressDialog.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ketQua_Screen(
                                  user: widget.User,
                                ),
                              ),
                            );
                            _ketQuaChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                            );
                            _LichSuChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                              widget.User.uid,
                            );
                            _ChiTietLichSuChoi(
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              widget.list[i].doKho.toString(),
                              random,
                            );
                            isKT = true;
                          } else {
                            hienDapAnDung();
                            time = 30;
                          }
                        }, // Chưa xử lý
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      'C. ${widget.list[i].dapAnC}',
                      softWrap: true,
                      style: TextStyle(
                        color: Color.fromARGB(250, 250, 250, 250),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: macDinhD
                      ? isKiemTraD
                          ? Colors.green
                          : Colors.red
                      : Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(200, 90),
                    maximumSize: Size(200, 90),
                  ),
                  onPressed: isButton
                      ? null
                      : () {
                          lsChiTietDapAn.add(widget.list[i].dapAnD.toString());
                          ProgressDialog progressDialog = ProgressDialog(
                            context,
                            title: const Text('Đang lấy dữ liệu'),
                            message: const Text('Làm ơn chờ một chút!'),
                          );
                          setState(() {
                            macDinhD = true;
                            isButton = true;
                          });
                          if (this.widget.list[i].dapAnD ==
                              this.widget.list[i].dapAnDung) {
                            if (isKTMuaDA) {
                              diem += 20;
                              demCauDung += 1;
                              isKTMuaDA = false;
                            } else {
                              setState(() {
                                isKiemTraD = true;
                                diem += 50;
                                demCauDung += 1;
                              });
                            }
                          } else {
                            setState(() {
                              isKiemTraD = false;
                              diem += 0;
                              demCauDung += 0;
                            });
                          }
                          if (i == 9) {
                            int random = Random().nextInt(100000);
                            progressDialog.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ketQua_Screen(
                                  user: widget.User,
                                ),
                              ),
                            );
                            _ketQuaChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                            );
                            _LichSuChoi(
                              diem,
                              widget.User.FullName.toString(),
                              widget.list[i].doKho.toString(),
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              demCauDung.toString(),
                              thoiGian,
                              widget.User.uid,
                            );
                            _ChiTietLichSuChoi(
                              widget.list[i].linhVucId == 2
                                  ? "Lịch Sử"
                                  : "Địa Lý",
                              widget.list[i].doKho.toString(),
                              random,
                            );
                            isKT = true;
                          } else {
                            hienDapAnDung();
                            time = 30;
                          }
                        }, // Chưa xử lý
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      'D. ${this.widget.list[i].dapAnD}',
                      softWrap: true,
                      style: TextStyle(
                        color: Color.fromARGB(250, 250, 250, 250),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
//=========================================================//
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: backButton,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              goiYSection,
              timeSection,
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  contentSection,
                  diemSection,
                ],
              ),
              dapAnSection,
            ],
          ),
        ),
      ),
    );
  }

  void _ketQuaChoi(int diem, String ten, String doKho, String linhVuc,
      String dapAnDung, String thoigian) {
    ref.child("KetQuaChoi").child(widget.User.uid).push().set({
      'Diem': diem,
      'Ten': ten,
      'DoKho': doKho,
      'LinhVuc': linhVuc,
      'SoDapAnDung': dapAnDung,
      'ThoiGian': thoigian,
    });
  }

  void _LichSuChoi(int diem, String ten, String doKho, String linhVuc,
      String dapAnDung, String thoigian, String uid) {
    ref.child("LichSuChoi").push().set({
      'Diem': diem,
      'Ten': ten,
      'DoKho': doKho,
      'LinhVuc': linhVuc,
      'SoDapAnDung': dapAnDung,
      'ThoiGian': thoigian,
      'Uid': uid,
    });
  }

  void _ChiTietLichSuChoi(
    String strLinhVuc,
    String strDoKho,
    int r,
  ) {
    for (int x = 0; x < lsChiTietDapAn.length; x++) {
      ref.child("ChiTietLichSu").child(r.toString()).update({
        'LinhVuc': strLinhVuc,
        'DoKho': strDoKho,
        'Cau ${x + 1}': lsChiTietDapAn[x].toString(),
      });
    }
  }
}
