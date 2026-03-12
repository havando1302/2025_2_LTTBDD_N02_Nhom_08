import 'package:flutter/material.dart';
import 'package:musicbox/constants/app_colors.dart';
import 'package:musicbox/models/songs_model.dart';
import 'package:musicbox/models/artist_model.dart';
import 'package:musicbox/controllers/play_music.dart';

class MusicPlayerScreen extends StatefulWidget {
  final SongModel song;
  final List<SongModel> playlist;

  const MusicPlayerScreen({
    super.key,
    required this.song,
    required this.playlist,
  });

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final MusicPlayerController controller = MusicPlayerController();

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  bool isPlaying = true;

  @override
  void initState() {
    super.initState();

    controller.playlist = widget.playlist;
    controller.playSong(widget.song);

    controller.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });

    controller.durationStream.listen((d) {
      setState(() {
        duration = d;
      });
    });
  }

  String formatTime(Duration d) {
    String min = d.inMinutes.toString().padLeft(2, '0');
    String sec = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  @override
  Widget build(BuildContext context) {
    final SongModel song = controller.currentSong ?? widget.song;
    final artist = ArtistModel.mockArtists.firstWhere(
      (a) => a.id == song.artistId,
    );

    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      appBar: AppBar(
        backgroundColor: Color(MyColor.pr1),
        elevation: 0,
        title: Text(
          song.title,
          style: const TextStyle(color: Color(MyColor.white)),
        ),
        iconTheme: const IconThemeData(color: Color(MyColor.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                song.imageUrl,
                height: 260,
                width: 260,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              song.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(MyColor.white),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              artist.name,
              style: const TextStyle(color: Color(MyColor.grey), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
