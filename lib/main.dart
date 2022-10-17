import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/main_block.dart';
import 'package:untitled1/test_screen.dart';

import 'di/di.dart';

void main() async {
  await configureDependencies(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<MainBlock>(
      create: (_) => getIt<MainBlock>(),
      dispose: (_, block) => block.dispose(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var block = context.read<MainBlock>();
    return StreamBuilder<int>(
      stream: block.countStream,
      builder: (context, snapshot) {
        //if(snapshot.data == null) return const SizedBox.shrink();

        int? count = snapshot.data;

        return Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TestScreen(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                color: Colors.green,
                child: Text(count.toString()),
              ),
            )
          ),
        );
      }
    );
  }
}
