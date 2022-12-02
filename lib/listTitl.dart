import 'package:flutter/material.dart';
import 'package:modul6_task5_network/coments/comment.dart';
import 'package:modul6_task5_network/network.dart';

class MyListTitl extends StatefulWidget {
  const MyListTitl({super.key});

  @override
  State<MyListTitl> createState() => _MyListTitlState();
}

class _MyListTitlState extends State<MyListTitl> {
  List<Photos> photo = [];
  String t = "";
  @override
  void initState() {
    Network.getPhoto(Network.apiPhoto, null).then((value) {
      setState(() {
        photo = value ?? [];
        print("list: $value");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: photo.isNotEmpty == true? Center(
        child: Container(
          color: Colors.red,
          height: 200,
          width: double.infinity,
          child: Text(t),
        ),
      ): Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.purple,
          height: 200,
          width: double.infinity,
          child: Text(""),
        ),
      ),
    );

    // return Scaffold(
    //   body: ListView.builder(itemBuilder: (context, index) {
    //     return Container(
    //       height: 200,
    //       color: Colors.red,
    //       margin: const EdgeInsets.all(12),
    //       child: Text(comment[index].email??""),
    //     );
    //   },itemCount: comment.length),
    // );
  }
}
