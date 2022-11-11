
import 'package:flutter/material.dart';
import 'package:modul6_task5_network/listTitl.dart';
import 'package:modul6_task5_network/pages/users.dart';

void main(List<String> args) {
  runApp(MyNetwork());
}

class MyNetwork extends StatefulWidget {
  MyNetwork({super.key});

  @override
  State<MyNetwork> createState() => _MyNetworkState();
}

class _MyNetworkState extends State<MyNetwork> {
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyListTitl(),
    );
  }
}
