import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modul6_task5_network/coments/comment.dart';
import 'package:modul6_task5_network/network.dart';

class MyPosts1 extends StatefulWidget {
  int userId;
  int id;
  MyPosts1({
    super.key,
    required this.userId,
    required this.id,
  });

  @override
  State<MyPosts1> createState() => _MyPosts1State(userId, id);
}

class _MyPosts1State extends State<MyPosts1> {
  int userId;
  int id;
  _MyPosts1State(this.userId, this.id);

  List<Comment> coment = [];
  List<Posts> posts = [];

  bool comentIcon = true;

  @override
  void initState() {
    Network.getPosts(Network.apiPost, {
      "userId": "$userId",
    }).then((value) {
      if (value != null) {
        setState(() {
          posts = value;
        });
      } else {
        setState(() {
          posts;
        });
      }
    });
    Network.getComment(Network.apiComment, {
      "postId": "${id + 1}",
    }).then((value) {
      if (value != null) {
        setState(() {
          coment = value;
        });
      } else {
        setState(() {
          coment;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: posts.isNotEmpty == false
            ? const Text(
                "No Posts",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            : const Text(
                "Posts: 1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
        centerTitle: true,
      ),
      body: posts.isNotEmpty == true
          ? Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _columnBody(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            comentIcon = !comentIcon;
                          });
                        },
                        child: Row(
                          children: [
                            Text("  comments: ${coment.length}"),
                            Text(""),
                            Icon(
                              comentIcon
                                  ? Icons.more_horiz
                                  : Icons.arrow_downward,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        comentIcon
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  coment.length,
                                  (index) => _rowComments(index),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            )),
    );
  }

  _rowComments(int index) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                "assets/images/photo${index}.jpg",
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " name:",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          "  ${coment[index].name}",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " email:",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          "  ${coment[index].email}",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " body:",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          "  ${coment[index].body}",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          // maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  _columnBody() {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              " title:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Text(
                "  ${posts[id].title}",
                style: TextStyle(
                  color: Colors.grey.shade600,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              " body:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Text(
                "  ${posts[id].body}",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
