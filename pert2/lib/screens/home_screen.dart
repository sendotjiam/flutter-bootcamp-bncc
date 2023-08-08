import 'package:flutter/material.dart';
import 'package:pert2/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.yellow,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blueGrey,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DetailScreen(title: "Detail",),
                              ),
                            );
                          },
                          child: const Text("Button 1"),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.blue,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/detail");
                        },
                        child: const Text("Button 2"),
                      ),
                    ),
                  ],
                ),
                const Text("1. PERTEMUAN 2"),
                const SizedBox(
                  height: 24,
                ),
                const Text("2. PERTEMUAN 2"),
                const SizedBox(
                  height: 24,
                ),
                Image.asset("assets/images/testimage.png"),
                const SizedBox(
                  height: 24,
                ),
                Image.network(
                  "https://arzerin.com/wp-content/uploads/2019/11/MainAxisAlignment.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
