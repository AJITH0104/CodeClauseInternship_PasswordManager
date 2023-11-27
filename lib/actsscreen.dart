import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/passwordscreen.dart';

import 'addacc.dart';

class actscreen extends StatefulWidget {
  const actscreen({super.key});

  @override
  State<actscreen> createState() => _actscreenState();
}

class _actscreenState extends State<actscreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  late final Stream<QuerySnapshot> us =
      FirebaseFirestore.instance.collection(user!.email.toString()).snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => addscreen())),
          child: Icon(
            Icons.add_box_rounded,
            size: 40,
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome,',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                user!.email.toString(),
                style: GoogleFonts.playfairDisplay(
                    fontSize: 30, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Container(
                  color: Colors.grey.withOpacity(0.5), //remove it later on
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: us,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) return Text('There is some error');
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Container(
                          child: Text(
                            'LOADING........',
                            style: GoogleFonts.playfairDisplay(
                                color: Colors.white, fontSize: 40),
                          ),
                          margin: EdgeInsets.all(15),
                        );
                      final data = snapshot.requireData;
                      return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => passscreen(
                                            data.docs[index]['service'])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Center(
                                          child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          // data.docs[index]['service']
                                          //     ['service1'],
                                          data.docs[index]['service'],
                                          style: GoogleFonts.playfair(
                                            fontSize: 40,
                                          ),
                                        ),
                                      )),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection(
                                                    user!.email.toString())
                                                .doc(
                                                    data.docs[index]['service'])
                                                .delete();
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            //  color: Colors.black,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
