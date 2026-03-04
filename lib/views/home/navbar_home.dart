import 'package:flutter/material.dart';
import 'package:musicbox/constants/app_colors.dart';
import 'package:musicbox/views/home/app_home.dart';
import 'package:musicbox/views/library/app_library.dart';
import 'package:musicbox/views/profile/app_profile.dart';
import 'package:musicbox/views/search/app_search.dart';
import 'package:musicbox/translates/app_localizations.dart';

class HomeCenter extends StatefulWidget {
  const HomeCenter({super.key});

  @override
  State<HomeCenter> createState() => _HomeCenterState();
}

class _HomeCenterState extends State<HomeCenter> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    PageLibrary(),
    SearchPage(),
    UserProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          //thiết lập màu cho navbar
          selectedItemColor: Color(MyColor.pr4),
          unselectedItemColor: Color(MyColor.white),
          backgroundColor: Color(MyColor.black),
          iconSize: 32,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/home.png')),
              label: t.home,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/library.png')),

              label: t.library,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/search.png')),
              label: t.search,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/profile.png')),
              label: t.profile,
            ),
          ],
        ),
      ),
    );
  }
}
