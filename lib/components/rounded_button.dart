import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onpress;
  final String txt;
  const RoundButton({
    Key? key,
    required this.onpress,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 69, // blur radius
              offset: Offset(0, 4), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xff2F286F),
          // gradient: LinearGradient(
          //   colors: [
          //     const Color(0xFFFC466B).withOpacity(0.85),
          //     const Color(0xFF3F5EFB).withOpacity(0.21),
          //   ],
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: GoogleFonts.barlow(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
