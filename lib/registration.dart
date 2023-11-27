import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/login.dart';

class regis extends StatelessWidget {
  regis({super.key});
  late String username, password;
  signupwithfireb(String usname, String pass) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential uscr = await auth.createUserWithEmailAndPassword(
          email: usname, password: pass);
      User? user;
      await user!.updateProfile(displayName: usname);
      await user.reload();
      user = auth.currentUser;
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.grey.withOpacity(0.4),
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Welcome',
                        style: GoogleFonts.playfairDisplay(
                            color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        'Lets get your passwords safe',
                        style: GoogleFonts.playfairDisplay(
                            color: Colors.white, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 20),
                        child: TextFormField(
                          onChanged: (value) {
                            username = value;
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
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 20),
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
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          try {
                            final newuser =
                                await auth.createUserWithEmailAndPassword(
                                    email: username, password: password);
                            if (newuser != null)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginpg()));
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
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
                              child: Text('Signup',
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
            ),
          ],
        ),
      ),
    );
  }
}
