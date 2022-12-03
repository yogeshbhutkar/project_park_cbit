import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

late User loggedIn;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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

  String greet() {
    final hour = TimeOfDay.now().hour;

    if (hour <= 12) {
      return 'Good Morning,';
    } else if (hour <= 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff0F0C29),
                Color(0xff302B63),
                Color(0xff24243E),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 8, 8, 8)
                                      .withOpacity(0.8), //color of shadow
                                  spreadRadius: 15, //spread radius
                                  blurRadius: 69, // blur radius
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(18),
                              ),
                              gradient: RadialGradient(
                                colors: [
                                  const Color(0xffC6C6C6).withOpacity(0.4),
                                  const Color(0xffC6C6C6).withOpacity(0.6),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: img(),
                                radius: 20,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                greet(),
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                loggedIn.displayName.toString(),
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 8, 8, 8)
                                  .withOpacity(0.8), //color of shadow
                              spreadRadius: 15, //spread radius
                              blurRadius: 69, // blur radius
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(18),
                          ),
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xffC6C6C6).withOpacity(0.4),
                              const Color(0xffC6C6C6).withOpacity(0.5),
                            ],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.notifications,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 40.0,
                    right: 64,
                  ),
                  child: Text(
                    'Locate your parking space',
                    style: GoogleFonts.barlow(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 37,
                      height: 1.25,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(69.0),
                topLeft: Radius.circular(69.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: 18,
                    right: 18,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 8, 8, 8)
                              .withOpacity(0.25), //color of shadow
                          spreadRadius: 2, //spread radius
                          blurRadius: 70, // blur radius
                          offset:
                              const Offset(0, 4), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: kTextFieldDecorationForWelcome.copyWith(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.09,
                              right: 16,
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Color(0xff777777),
                            ),
                          ),
                          hintText: 'Search space ...',
                          hintStyle: const TextStyle(
                            color: Color(0xff777777),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 8, 8, 8)
                                  .withOpacity(0.25), //color of shadow
                              spreadRadius: 4.5, //spread radius
                              blurRadius: 75, // blur radius
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/scooter.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 8, 8, 8)
                                  .withOpacity(0.25), //color of shadow
                              spreadRadius: 4.5, //spread radius
                              blurRadius: 75, // blur radius
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/car.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 8, 8, 8)
                                  .withOpacity(0.25), //color of shadow
                              spreadRadius: 4.5, //spread radius
                              blurRadius: 75, // blur radius
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/truck.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 8, 8, 8)
                                  .withOpacity(0.25), //color of shadow
                              spreadRadius: 4.5, //spread radius
                              blurRadius: 75, // blur radius
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/bus.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36.0, left: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Spaces',
                        style: GoogleFonts.barlow(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Text(
                            'More',
                            style: GoogleFonts.barlow(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xff302B63),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/college1.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text('Parking Space 1'),
                            ],
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xff302B63),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/college2.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text('Parking Space 2'),
                            ],
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xff302B63),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/college3.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text('Parking Space 3'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
