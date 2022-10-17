import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget{
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async => true,
      child: const Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }
}