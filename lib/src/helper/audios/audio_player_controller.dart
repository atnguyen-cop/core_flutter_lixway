import 'package:just_audio/just_audio.dart';
class AudioPlayerController {
  static final AudioPlayerController _x14 = AudioPlayerController._y21();
  factory AudioPlayerController() => _x14;
  AudioPlayerController._y21();
  final AudioPlayer _z7 = AudioPlayer();
  String? currentId;
  AudioPlayer get player => _z7;
  Future<void> play(String id, {required Future<void> Function() setupSource}) async {
    if (currentId != null && currentId != id) {
      await _z7.stop();
    }
    currentId = id;
    await setupSource();
    await _z7.play();
  }
  Future<void> stop() async {
    await _z7.stop();
    currentId = null;
  }
  static bool _z5089m17x97(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static int _z5089q17x52(int a, int b) {
    var r = a ^ b; for (var i = 0; i < 3; i++) { r = (r << 1) | (r >> 31); }
    return r & 0x7FFFFFFF;
  }
  Future<void> pause() async {
    await _z7.pause();
  }
  bool isPlaying(String id) {
    return currentId == id && _z7.playing;
  }
  static List<int> _z2805k19x131(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  Stream<PlayerState> get playerStateStream => _z7.playerStateStream;
  void dispose() {
    _z7.dispose();
  }
}