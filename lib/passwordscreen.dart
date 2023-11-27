import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class passscreen extends StatelessWidget {
  passscreen(this.service);
  String service;
  getdata() async {
    // QuerySnapshot snap =
    //     await FirebaseFirestore.instance.collection(service).get();
    // snap.docs.forEach((document) {
    //   print(document);
    // });
    // return snap.docs;
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = FirebaseAuth.instance.currentUser;

    final docRef = FirebaseFirestore.instance
        .collection(user!.email.toString())
        .doc(service);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'Details',
                style: GoogleFonts.play(color: Colors.white, fontSize: 35),
              ),
            ),
            backgroundColor: Colors.black,
            body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(user!.email.toString())
                    .doc(service)
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return new Text("Loading");
                  }
                  var userDocument = snapshot.data;
                  return tdes(userDocument['username'],
                      userDocument['password'], userDocument['service']);
                  // return new Text(
                  //   userDocument["password"],
                  //   style: TextStyle(color: Colors.white),
                  // );
                })));
  }
}

class tdes extends StatelessWidget {
  tdes(this.username, this.password, this.service);
  String username, service, password;

  textdes(String content) {
    return Text(
      content,
      style: GoogleFonts.playfairDisplay(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textdes('Service'),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.grey,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    service,
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 35),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 4)),
              ),
              SizedBox(
                height: 30,
              ),
              textdes('Username'),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.grey,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    username,
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 35),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 4)),
              ),
              SizedBox(
                height: 30,
              ),
              textdes('Password'),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.grey,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    password,
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 35),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 4)),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFdb783b)),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Done!',
                  style: GoogleFonts.content(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
