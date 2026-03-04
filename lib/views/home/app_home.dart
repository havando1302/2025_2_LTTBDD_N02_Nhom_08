import 'package:flutter/material.dart';
import 'package:musicbox/models/songs_model.dart';
import 'package:musicbox/models/albums_model.dart';
import 'package:musicbox/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCountry = 'Tất cả';

  List<SongModel> get filteredSongs {
    if (selectedCountry == 'Tất cả') {
      return SongModel.mockSongs;
    } else if (selectedCountry == 'Việt Nam') {
      return SongModel.mockSongs
          .where((song) => song.country == 'Việt Nam')
          .toList();
    } else {
      return SongModel.mockSongs
          .where((song) => song.country != 'Việt Nam')
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final topSongs = SongModel.mockSongs.take(5).toList();

    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Những album nổi bật.
          const Text(
            'Tuyển tập',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
