import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome, Omar"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.brightness_7_sharp,
              ),),
        ],
      ),
      body: const Column(
        children: [
          
        ],
      ),
    );
  }
}
