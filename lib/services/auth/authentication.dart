import 'package:firebasedemo/Screens/Register/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Homepage(),
    );
  }
}
