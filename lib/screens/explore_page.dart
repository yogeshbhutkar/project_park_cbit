import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_park_cbit/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

List elements = [];

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  @override
  void initState() {
    // TODO: implement initState
    // getUsers();
    super.initState();
  }

  getUsers() async {
    await for (var snapshot in usersRef.snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Text(
                'Book Parking Space',
                style: GoogleFonts.barlow(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1D1853),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              getCurrentDate(),
              style: GoogleFonts.barlow(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xff1D1853),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: MessagesStream(),
          ),
        ],
      ),
    );
  }
}

Color k = Colors.black;
var wdth = 1.0;

class MessagesStream extends StatefulWidget {
  const MessagesStream({super.key});

  @override
  State<MessagesStream> createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data?.docs;
            List<Widget> gridCars = [];
            for (var i = 0; i < 12; i++) {
              gridCars.add(Container());
            }
            for (var message in messages!) {
              var idCar = int.parse(message.get('id')) - 1;
              if (message.get('state') == '1') {
                gridCars[idCar] = Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${idCar + 1}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: Image.asset('assets/car1.png')),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                gridCars[idCar] = GestureDetector(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${idCar + 1}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: k,
                        width: wdth,
                      ),
                      color: Colors.white,
                    ),
                  ),
                );
              }
            }

            return Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width * 0.16,
                  right: MediaQuery.of(context).size.width * 0.16),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: gridCars,
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
