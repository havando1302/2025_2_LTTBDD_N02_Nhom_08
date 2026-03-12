import 'package:audioplayers/audioplayers.dart';
import 'package:musicbox/models/songs_model.dart';

class MusicPlayerController {
  final AudioPlayer player = AudioPlayer();

  SongModel? currentSong;
  List<SongModel> playlist = [];

  bool isPlaying = false;

  Future<void> playSong(SongModel song) async {
    currentSong = song;

    await player.stop();

    await player.play(AssetSource(song.audioUrl.replaceFirst('assets/', '')));

    isPlaying = true;
  }

  Future<void> pause() async {
    await player.pause();
    isPlaying = false;
  }

  Future<void> resume() async {
    await player.resume();
    isPlaying = true;
  }

  Future<void> nextSong() async {
    if (currentSong == null) return;

    int index = playlist.indexWhere((s) => s.id == currentSong!.id);

    if (index < playlist.length - 1) {
      playSong(playlist[index + 1]);
    }
  }

  Future<void> prevSong() async {
    if (currentSong == null) return;

    int index = playlist.indexWhere((s) => s.id == currentSong!.id);

    if (index > 0) {
      playSong(playlist[index - 1]);
    }
  }

  Future<void> seek(Duration position) async {
    await player.seek(position);
  }

  Stream<Duration> get positionStream => player.onPositionChanged;

  Stream<Duration> get durationStream => player.onDurationChanged;
}
