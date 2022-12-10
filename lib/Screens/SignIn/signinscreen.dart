import 'package:firebasedemo/Screens/Register/registerscreen.dart';
import 'package:firebasedemo/services/auth/auth.dart';
// import 'package:firebasedemo/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_core/firebase_core.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.white, Color.fromARGB(255, 248, 171, 113)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(196, 255, 192, 153),
                          blurRadius: 1,
                          offset: Offset(2, 6), // Shadow position
                        ),
                      ]),
                  child: Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 40, horizontal: 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          196, 255, 192, 153)),
                                  onPressed: () {},
                                  child: const Text("  Login  "),
                                ),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shadowColor: const Color.fromARGB(
                                        196, 255, 192, 153),
                                    side: const BorderSide(
                                        color:
                                            Color.fromARGB(196, 255, 192, 153)),
                                    foregroundColor: const Color.fromARGB(
                                        196, 255, 192, 153)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Homepage()),
                                  );
                                },
                                child: const Text("Sign Up"),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter an email'
                                          : null,
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                        });
                                      },
                                      textAlign: TextAlign.left,
                                      autofocus: true,
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  196, 255, 192, 153),
                                              width: 1.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Color.fromARGB(
                                              196, 255, 192, 153),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  196, 255, 192, 153),
                                              width: 1.0),
                                        ),
                                        hintText: 'kwawkumi@gmail.com',
                                        labelText: "Email",
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.00, horizontal: 30.00),
                                  child: TextFormField(
                                    validator: (val) => val!.length < 6
                                        ? 'Enter a password 6+ chars long'
                                        : null,
                                    onChanged: (val) {
                                      password = val.toString();
                                    },
                                    obscureText: true,
                                    textAlign: TextAlign.left,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.5),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                196, 255, 192, 153),
                                            width: 1.0),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color:
                                            Color.fromARGB(196, 255, 192, 153),
                                      ),
                                      suffixIcon: const Icon(
                                        Icons.visibility,
                                        color:
                                            Color.fromARGB(196, 255, 192, 153),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                196, 255, 192, 153),
                                            width: 1.0),
                                      ),
                                      hintText: 'Password',
                                      labelText: "Password",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.00, horizontal: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text("Password Recovery"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        shadowColor: const Color.fromARGB(
                                            196, 255, 192, 153),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                196, 255, 192, 153)),
                                        foregroundColor: const Color.fromARGB(
                                            196, 255, 192, 153)),
                                    onPressed: () async {
                                      print("valid");
                                      if (_formKey.currentState!.validate()) {
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() => error =
                                              'Could not sign in with those credentials');
                                        }
                                      }
                                    },
                                    child: const Text(
                                      "      Sign In      ",
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                )
                              ]),
                        )
                      ],
                    ),
                  )),
            )));
  }
}
