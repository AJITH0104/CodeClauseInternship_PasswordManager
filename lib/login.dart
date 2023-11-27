import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'actsscreen.dart';

class loginpg extends StatelessWidget {
  loginpg({super.key});
  late String username, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: carddes(
                  'Welcome Back!', 'Login', 'Lets get back to your passwords'),
            ),
          ],
        ),
      ),
    );
  }
}

class carddes extends StatelessWidget {
  carddes(this.title, this.but, this.con);
  late String title, con, but, username, password;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(0.4),
      child: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                    color: Colors.white, fontSize: 40),
              ),
              Text(
                con,
                style: GoogleFonts.playfairDisplay(
                    color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
                child: TextFormField(
                  onChanged: (value) {
                    username = value;
                    print(username);
                  },
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.white, fontSize: 19),
                  decoration: InputDecoration(
                    fillColor: Colors.black.withOpacity(0.2),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
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
                      fillColor: Colors.black.withOpacity(0.2),
                      filled: true,
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  try {
                    final user = await auth.signInWithEmailAndPassword(
                        email: username, password: password);

                    if (user != null)
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => actscreen()));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          gradient: LinearGradient(colors: [
                            Colors.blueAccent,
                            Colors.deepPurple,
                          ]),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black.withOpacity(0.50),
                              blurRadius: 16.0,
                            ),
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.grey,
                              blurRadius: 16.0,
                            ),
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 16.0,
                            ),
                          ]),
                      child: Text(but,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.0))),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
