

import 'package:flutter/material.dart';
import 'package:modul6_task5_network/network.dart';

class MyBodyNetwork extends StatefulWidget {
  const MyBodyNetwork({super.key});

  @override
  State<MyBodyNetwork> createState() => _MyBodyNetworkState();
}

class _MyBodyNetworkState extends State<MyBodyNetwork> {

  var data = "Empty";
  var data1 = "Empty";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Column(
              children: [
                Text(
                  data,
                  style: const TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      data = "Loading....";
                    });
                    Network.getData(Network.appiList, {"userId": "9"})
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          data = value;
                        });
                      } else {
                        setState(() {
                          data = "There is no data";
                        });
                      }
                    });
                  },
                  child: const Text("fetch data"),
                ),
                  ElevatedButton(
                onPressed: () {
                  setState(() {
                    data1 = "Fetching...";
                  });
                  Network.getUsers(Network.apiUsers, {"postId": "1"}).then((value) {
                    if (value != null) {
                      setState(() {
                        data1 = value[3].email ?? "No email";
                      });
                    } else {
                      setState(() {
                        data1 = "There is no data";
                      });
                    }
                  });
                },
                child: const Text("fetch comment data"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data1,
                style: const TextStyle(fontSize: 18),
              ),
              ],
            ),
          ),
        ),
      );
  }
}