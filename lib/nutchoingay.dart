import 'package:doan_lt_didong/choingay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class playButton extends StatefulWidget {
  @override
  State<playButton> createState() => playButton_State();
}

class playButton_State extends State<playButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: Color.fromARGB(255, 46, 181, 244),
            minimumSize: const Size(200, 90),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          // Xử lý sang trang chơi ngay
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChoiNgay(),
              ),
            );
          }, //=========================//
          icon: Image.asset(
            "images/play.png",
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          label: Text(
            'CHƠI NGAY',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline2,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
