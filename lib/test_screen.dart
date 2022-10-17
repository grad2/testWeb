import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget{
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: const Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }

}