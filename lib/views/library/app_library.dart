import 'package:flutter/material.dart';

class PageLibrary extends StatelessWidget {
  const PageLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thư viện'), centerTitle: true),
      body: const Center(
        child: Text(
          'LIBRARY PAGE',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
