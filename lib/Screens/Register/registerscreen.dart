import 'package:firebasedemo/Screens/SignIn/signinscreen.dart';
import 'package:firebasedemo/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_core/firebase_core.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String fullname = "";
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
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shadowColor: const Color.fromARGB(
                                          196, 255, 192, 153),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              196, 255, 192, 153)),
                                      foregroundColor: const Color.fromARGB(
                                          196, 255, 192, 153)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SingIn()),
                                    );
                                  },
                                  child: const Text("  Login  "),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        196, 255, 192, 153)),
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
                                        vertical: 10, horizontal: 30),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          fullname = val.toString();
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
                                          Icons.person,
                                          color: Color.fromARGB(
                                              196, 255, 192, 153),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  196, 255, 192, 153),
                                              width: 1.0),
                                        ),
                                        labelText: "FullName:",
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          email = val.toString();
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
                                    onChanged: (val) {
                                      setState(() {
                                        password = val.toString();
                                      });
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
                                      vertical: 0.00, horizontal: 30),
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
                                      print("hello its valid1");
                                      if (_formKey.currentState!.validate()) ;
                                      dynamic result = await _auth
                                          .createUserWithEmailAndPassword(
                                              email, password);
                                    },
                                    child: const Text(
                                      "      Register      ",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: const Color.fromARGB(
                                                    196, 255, 192, 153)),
                                            shape: BoxShape.circle),
                                      ),
                                      const SizedBox(
                                        height: 0,
                                        width: 15,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: const Color.fromARGB(
                                                    196, 255, 192, 153)),
                                            shape: BoxShape.circle),
                                        child: SvgPicture.asset(
                                          "assets/Svgs/gmail-svgrepo-com.svg",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 0,
                                        width: 15,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: const Color.fromARGB(
                                                    196, 255, 192, 153)),
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  )),
            )));
  }
}
