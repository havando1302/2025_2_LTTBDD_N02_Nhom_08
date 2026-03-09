import 'package:flutter/material.dart';
import 'package:musicbox/models/albums_model.dart';
import 'package:musicbox/models/songs_model.dart';
import 'package:musicbox/constants/app_colors.dart';

class AlbumDetailPage extends StatelessWidget {
  final AlbumModel album;

  const AlbumDetailPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final songs = SongModel.mockSongs
        .where((song) => song.albumId == album.id)
        .toList();

    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      appBar: AppBar(
        backgroundColor: Color(MyColor.pr1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(MyColor.white)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(album.title, style: TextStyle(color: Color(MyColor.white))),
      ),

      body: Column(
        children: [
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              album.imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Năm ${album.year}",
            style: TextStyle(color: Color(MyColor.grey)),
          ),

          SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];

                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      song.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),

                  title: Text(
                    song.title,
                    style: TextStyle(
                      color: Color(MyColor.white),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  subtitle: Text(
                    song.country,
                    style: TextStyle(color: Color(MyColor.grey)),
                  ),

                  trailing: IconButton(
                    icon: Icon(Icons.play_arrow, color: Color(MyColor.white)),
                    onPressed: () {},
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
