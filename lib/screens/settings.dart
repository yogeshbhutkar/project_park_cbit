import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_park_cbit/components/rounded_button.dart';

import 'login_screen.dart';

late User loggedIn;
final googleSignIn = GoogleSignIn();

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedIn = user;
      }
    } catch (e) {
      //
    }
  }

  ImageProvider img() {
    if (loggedIn.photoURL.toString() != "null") {
      return NetworkImage(loggedIn.photoURL.toString());
    } else {
      return const AssetImage('images/man.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 8, 8, 8)
                      .withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 69, // blur radius
                  offset: const Offset(0, 4), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
              ],
              shape: BoxShape.circle,
              color: const Color(0xFF3A3665),
            ),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 51, 50, 56),
                    radius: 75.0,
                    backgroundImage: img(),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.07,
              left: 24.0,
              bottom: 8.0),
          child: Text(
            'Name',
            style: GoogleFonts.barlow(
                color: Color(0xff24243E),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Container(
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 110, 108, 108)
                        .withOpacity(0.4), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 50, // blur radius
                    offset: const Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  loggedIn.displayName.toString(),
                  style: GoogleFonts.barlow(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: 24.0,
              bottom: 8.0),
          child: Text(
            'Email',
            style: GoogleFonts.barlow(
                color: Color(0xff24243E),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Container(
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 110, 108, 108)
                        .withOpacity(0.4), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 50, // blur radius
                    offset: const Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  loggedIn.email.toString(),
                  style: GoogleFonts.barlow(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: 24.0,
              bottom: 8.0),
          child: Text(
            'Contact Number',
            style: GoogleFonts.barlow(
                color: Color(0xff24243E),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Container(
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 110, 108, 108)
                        .withOpacity(0.4), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 50, // blur radius
                    offset: const Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  loggedIn.phoneNumber.toString() == 'null' ||
                          loggedIn.phoneNumber.toString().isEmpty
                      ? 'Add your phone number'
                      : loggedIn.phoneNumber.toString(),
                  style: GoogleFonts.barlow(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.045,
              left: 32,
              right: 32),
          child: RoundButton(
            onpress: () {
              _auth.signOut();
              googleSignIn.disconnect();
              Navigator.pushNamed(context, LoginScreen.id);
            },
            txt: 'Sign Out',
          ),
        )
      ],
    );
  }
}
