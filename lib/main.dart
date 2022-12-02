
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return  MaterialApp(
         theme: ThemeData(
        // textTheme: GoogleFonts.acmeTextTheme(),
        textTheme: GoogleFonts.aliceTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: MyUsers(),
    );
  }
}
