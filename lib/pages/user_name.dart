import 'package:flutter/material.dart';
import 'package:modul6_task5_network/network.dart';
import 'package:modul6_task5_network/pages/photos.dart';
import 'package:modul6_task5_network/pages/posts1.dart';
import 'package:modul6_task5_network/pages/users.dart';

import '../coments/comment.dart';

class MyUserName extends StatefulWidget {
  String name;
  int userId;
  // List<Todo> todo;
  MyUserName({super.key, required this.name, required this.userId});

  @override
  State<MyUserName> createState() => _MyUserNameState(name, userId);
}

class _MyUserNameState extends State<MyUserName> {
  String name;
  int userId;

  List<Todo> todo = [];
  List<Album> album = [];
  List<Posts> post = [];

  _MyUserNameState(this.name, this.userId);

  @override
  void initState() {
    setState(() {
      Network.getTodo(Network.apiTodo, {"userId": "$userId"}).then((value) {
        if (value != null) {
          setState(() {
            todo = value;
          });
        } else {
          setState(() {
            todo;
          });
        }
      });
      Network.getAlbums(Network.apiAlbum, {"userId": "$userId"}).then((value) {
        if (value != null) {
          setState(() {
            album = value;
          });
        } else {
          setState(() {
            album;
          });
        }
      });
      Network.getPosts(Network.apiPost, {"userId": "$userId"}).then((value) {
        if (value != null) {
          setState(() {
            post = value;
          });
        } else {
          setState(() {
            post;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MyUsers(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Todo"),
              ),
              Tab(
                child: Text("Alboms"),
              ),
              Tab(
                child: Text("Post"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _Container1(),
            _Container2(),
            _Container3(),
          ],
        ),
      ),
    );
  }

  Widget _circprogres() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  _Container1() {
    return Container(
      color: Colors.red,
      child: todo.isNotEmpty == false
          ? _circprogres()
          : SingleChildScrollView(
              child: Column(
                children: List.generate(
                  todo.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(
                            left: 12, top: 8, bottom: 6, right: 10),
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "userId: $userId",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "id: ${todo[index].id}",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "title:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 240,
                                      child: Text(
                                        todo[index].title ?? "no title",
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Network.patchData(Network.apiTodo,
                                    //     {"completed": true}, index + 1);
                                  },
                                  icon: Icon(todo[index].completed ?? false
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank),
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  _Container2() {
    return Container(
      color: Colors.green,
      child: album.isNotEmpty == false
          ? _circprogres()
          : SingleChildScrollView(
              child: Column(
                children: List.generate(
                  album.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyPhotos(
                                albumId: album[index].id ?? -1, name: name),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(
                              left: 20, top: 12, bottom: 16, right: 10),
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "userId: $userId",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "id: ${album[index].id}",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Name:  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      album[index].title ?? "no title",
                                      style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  _Container3() {
    return Container(
      color: Colors.amber,
      child: post.isNotEmpty == false
          ? _circprogres()
          : SingleChildScrollView(
              child: Column(
                children: List.generate(
                  post.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                MyPosts1(userId: userId, id: index),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(
                              left: 20, top: 6, bottom: 4, right: 10),
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "userId: $userId",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "id: ${post[index].id}",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "title:  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      post[index].title ?? "no title",
                                      style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "body:  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      post[index].body ?? "no title",
                                      style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
