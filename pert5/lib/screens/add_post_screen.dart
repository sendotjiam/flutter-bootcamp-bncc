import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(hintText: "Body"),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 32,
              color: Colors.amber,
              child: TextButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (_controller1.text.isNotEmpty &&
                      _controller2.text.isNotEmpty) {
                    Navigator.of(context)
                        .pop((_controller1.text, _controller2.text));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
