import 'package:flutter/material.dart';
import 'package:musicbox/constants/app_colors.dart';

class PageLibrary extends StatefulWidget {
  const PageLibrary({super.key});

  @override
  State<PageLibrary> createState() => _PageLibraryState();
}

class _PageLibraryState extends State<PageLibrary> {
  int selectedTab = 0;

  final List<String> tabs = ["All", "Songs", "Albums", "Artists"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            _tabs(),
            const SizedBox(height: 10),
            Expanded(child: _libraryList()),
          ],
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

  Widget _tabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(tabs.length, (index) => _tabItem(index)),
      ),
    );
  }

  Widget _tabItem(int index) {
    final bool selected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Color(MyColor.pr4) : Color(MyColor.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          tabs[index],
          style: TextStyle(
            color: selected ? Color(MyColor.white) : Color(MyColor.black),
          ),
        ),
      ),
    );
  }

  Widget _libraryList() {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {
        return const SizedBox();
      },
    );
  }
}
