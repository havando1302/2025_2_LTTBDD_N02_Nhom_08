import 'package:flutter/material.dart';
import 'package:musicbox/constants/app_colors.dart';

class PageLibrary extends StatefulWidget {
  const PageLibrary({super.key});

  @override
  State<PageLibrary> createState() => _PageLibraryState();
}

class _PageLibraryState extends State<PageLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_header()],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Thư viện",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
          Row(
            children: const [
              Icon(Icons.search, color: Color(MyColor.white)),
              SizedBox(width: 20),
              Icon(Icons.add, color: Color(MyColor.white)),
            ],
          ),
        ],
      ),
    );
  }
}
