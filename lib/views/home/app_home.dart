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
          const SizedBox(height: 8),

          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AlbumModel.mockAlbums.length,
              itemBuilder: (context, index) {
                final album = AlbumModel.mockAlbums[index];

                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          album.imageUrl,
                          height: 120,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        album.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(MyColor.white),
                        ),
                      ),
                      Text(
                        'Năm ${album.year}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(MyColor.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
