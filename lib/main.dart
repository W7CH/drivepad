// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'parameters.dart';

void main() {
  runApp(DrivePad());
}

class DrivePad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drive Pad',
      home: Parameters(),
    );
  }
}
