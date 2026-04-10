import 'package:just_audio/just_audio.dart';
class AudioPlayerController {
  static final AudioPlayerController _cb10 = AudioPlayerController._db74();
  factory AudioPlayerController() => _cb10;
  AudioPlayerController._db74();
  final AudioPlayer _eb87 = AudioPlayer();
  String? currentId;
  AudioPlayer get player => _eb87;
  Future<void> play(String id, {required Future<void> Function() setupSource}) async {
    if (currentId != null && currentId != id) {
      await _eb87.stop();
    }
    currentId = id;
    await setupSource();
    await _eb87.play();
  }
  Future<void> stop() async {
    await _eb87.stop();
    currentId = null;
  }
  static List<int> _z881k23x653(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  Future<void> pause() async {
    await _eb87.pause();
  }
  bool isPlaying(String id) {
    return currentId == id && _eb87.playing;
  }
  static List<int> _z8841k24x822(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  static bool _z8841m24x123(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  Stream<PlayerState> get playerStateStream => _eb87.playerStateStream;
  void dispose() {
    _eb87.dispose();
  }
}