import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/registration.dart';

import 'login.dart';

class destination extends StatelessWidget {
  const destination({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'images/Password.png',
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Password manager  keeps your passwords safe and secure ,also helping to maintain the passwords efficiently',
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FilledButton(
                  style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(200, 20)),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFdb783b))),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginpg())),
                  child: const Text(
                    "Click me to login!",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
              TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => regis())),
                  child: const Text(
                    "Lets sign you up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
