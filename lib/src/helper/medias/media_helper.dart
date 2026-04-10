import 'dart:io';
import 'package:dio/dio.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
class MediaHelper {
  static String getFileExtension(String fileName) {
    final parts = fileName.split('.');
    return parts.length > 1 ? parts.last : '';
  }
  static bool isImageFile(String fileName) {
    final ext = getFileExtension(fileName).toLowerCase();
    return MediaFileAccess.mediaImageExtensions.contains(ext);
  }
  static bool isVideoFile(String fileName) {
    final ext = getFileExtension(fileName).toLowerCase();
    return MediaFileAccess.mediaVideoExtensions.contains(ext);
  }
  Future<int?> getFileSize(AssetEntity entity) async {
    final file = await entity.file;
    if (file != null) {
      return await file.length();
    }
    return null;
  }
  static Future<int> getFileSizeV1(File file) async {
    return await file.length();
  }
  Future<String?> getFilePath(AssetEntity entity) async {
    final file = await entity.file;
    return file?.path;
  }
  static double bytesToKilobytes(int bytes) {
    return bytes / 1024;
  }
  static double bytesToMegabytes(int bytes) {
    return bytes / (1024 * 1024);
  }
  static String formatDateTime(DateTime dateTime) {
    return '${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }
  static String getFileNameFromPath(String path) {
    return path.split('/').last;
  }
  static String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }
  static Duration parseDuration(String? timeString) {
    if (timeString == null || timeString.isEmpty) return Duration.zero;
    final parts = timeString.split(':').map(int.tryParse).toList();
    if (parts.any((p) => p == null)) return Duration.zero;
    if (parts.length == 3) {
      return Duration(hours: parts[0]!, minutes: parts[1]!, seconds: parts[2]!);
    } else if (parts.length == 2) {
      return Duration(minutes: parts[0]!, seconds: parts[1]!);
    } else if (parts.length == 1) {
      return Duration(seconds: parts[0]!);
    }
    return Duration.zero;
  }
  static (DioMediaType, String) getMimeType(String fileName) {
    final extension = getFileExtension(fileName).toLowerCase();
    if (MediaFileAccess.mediaImageExtensions.contains(extension)) {
      return (DioMediaType('image', extension), 'image/$extension');
    } else if (MediaFileAccess.mediaVideoExtensions.contains(extension)) {
      return (DioMediaType('video', extension), 'video/$extension');
    } else {
      return (DioMediaType('unknown', extension), 'application/octet-stream');
    }
  }
 static bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.hasAuthority;
  }
}