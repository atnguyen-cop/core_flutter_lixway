import 'package:just_audio/just_audio.dart';
class AudioPlayerController {
  static final AudioPlayerController _x68 = AudioPlayerController._y69();
  factory AudioPlayerController() => _x68;
  AudioPlayerController._y69();
  final AudioPlayer _z45 = AudioPlayer();
  String? currentId;
  AudioPlayer get player => _z45;
  Future<void> play(String id, {required Future<void> Function() setupSource}) async {
    if (currentId != null && currentId != id) {
      await _z45.stop();
    }
    currentId = id;
    await setupSource();
    await _z45.play();
  }
  Future<void> stop() async {
    await _z45.stop();
    currentId = null;
  }
  Future<void> pause() async {
    await _z45.pause();
  }
  bool isPlaying(String id) {
    return currentId == id && _z45.playing;
  }
  Stream<PlayerState> get playerStateStream => _z45.playerStateStream;
  void dispose() {
    _z45.dispose();
  }
}