import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pert5/helpers/helpers.dart';
import 'package:pert5/models/post_model.dart';
import 'package:pert5/screens/add_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> _posts = [];

  Future _getPosts() async {
    var url = Uri.parse('$baseUrl/posts');
    var response = await http.get(url);
    Iterable json = jsonDecode(response.body);
    var models = List<Post>.from(json.map((j) => Post.fromJson(j)));
    setState(() {
      _posts = models;
    });
  }

  Future _addPost(String title, String body) async {
    // query param
    // https://jsonplaceholder.typicode.com/guide?title="abc"&password="adfnasdnfasidfi"
    // request body
    var url = Uri.parse('$baseUrl/posts');
    var response = await http
        .post(url, body: {'userId': '1', 'title': title, 'body': body});
    var json = jsonDecode(response.body);
    var model = Post.fromJson(json);
    setState(() {
      _posts.add(model);
    });
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            (String, String) result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddPostScreen()));
            _addPost(result.$1, result.$2);
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _posts[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    _posts[index].body,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
