import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class addscreen extends StatefulWidget {
  const addscreen({super.key});

  @override
  State<addscreen> createState() => _addscreenState();
}

class _addscreenState extends State<addscreen> {
  late String username, password, service;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Lets add your password',
                style: GoogleFonts.playfairDisplay(
                    color: Colors.white, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              'Username',
              style: GoogleFonts.playfairDisplay(
                  color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
              child: TextFormField(
                onChanged: (value) {
                  username = value;
                },
                style: GoogleFonts.playfairDisplay(
                    color: Colors.white, fontSize: 19),
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(8.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.white,
                      width: 5.0,
                    ),
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              'Password',
              style: GoogleFonts.playfairDisplay(
                  color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                },
                style: GoogleFonts.playfairDisplay(
                    color: Colors.white, fontSize: 19),
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(8.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.white,
                      width: 5.0,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              'Service',
              style: GoogleFonts.playfairDisplay(
                  color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
              child: TextFormField(
                onChanged: (value) {
                  service = value;
                },
                style: GoogleFonts.playfairDisplay(
                    color: Colors.white, fontSize: 19),
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(8.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.white,
                      width: 5.0,
                    ),
                  ),
                  labelText: 'Service',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FilledButton(
              onPressed: () async {
                String email =
                    FirebaseAuth.instance.currentUser!.email.toString();
                print('this is the email $email');
                dynamic collections = FirebaseFirestore.instance
                    .collection(email)
                    .doc(service)
                    .set({
                  'username': username,
                  'password': password,
                  'service': service
                });
                // await collections.add({
                //   'username': username,
                //   'password': password,
                //   'service': service
                // });

                // await collections.add({
                //   service: {
                //     'username': username,
                //     'password': password,
                //     'service1': service
                //   }
                // });

                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: GoogleFonts.sanchez(fontSize: 25),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFdb783b)),
                  minimumSize: MaterialStatePropertyAll(Size(250, 50))),
            ),
          ],
        ),
      ),
    );
  }
}
