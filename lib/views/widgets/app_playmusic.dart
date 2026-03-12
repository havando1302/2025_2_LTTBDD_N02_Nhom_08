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
  Widget build(BuildContext context) {}
}
