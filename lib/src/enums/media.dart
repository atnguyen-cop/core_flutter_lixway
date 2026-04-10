import 'package:gun_core_flutter/gun_core_flutter.dart';
enum EMediaType {
  all,
  image,
  video,
  calendar,
  contact,
  gallery,
  document,
  unknown,
  audio,
  application
}
final mediaValues = EnumValues({
  'all': EMediaType.all,
  'image': EMediaType.image,
  'video': EMediaType.video,
  'calendar': EMediaType.calendar,
  'contact': EMediaType.contact,
  'gallery': EMediaType.gallery,
  'document': EMediaType.document,
  'unknown': EMediaType.unknown,
  'audio': EMediaType.audio,
  'application': EMediaType.application,
});
extension EMediaExtension on EMediaType {
  String get name {
    switch (this) {
      case EMediaType.all:
        return 'all';
      case EMediaType.image:
        return 'image';
      case EMediaType.video:
        return 'video';
      case EMediaType.calendar:
        return 'calendar';
      case EMediaType.contact:
        return 'contact';
      case EMediaType.gallery:
        return 'gallery';
      case EMediaType.unknown:
        return 'unknown';
      case EMediaType.document:
        return 'document';
      case EMediaType.audio:
        return 'audio';
      case EMediaType.application:
        return 'application';
    }
  }
  int get value {
    switch (this) {
      case EMediaType.all:
        return 0;
      case EMediaType.image:
        return 1;
      case EMediaType.video:
        return 2;
        case EMediaType.audio:
        return 4;
      case EMediaType.contact:
        return 8;
      case EMediaType.gallery:
        return 32;
      case EMediaType.document:
        return 64;
      case EMediaType.calendar:
        return 16;
      case EMediaType.application:
        return 64;
      default:
        return 128;
    }
  }
}
enum EMediaCategory {
  image,
  video,
  audio,
  contact,
  document,
  application,
  calendar,
  unknown
}
extension EMediaCategoryExt on EMediaCategory {
  String toJson() {
    switch (this) {
      case EMediaCategory.image:
        return 'IMAGE';
      case EMediaCategory.video:
        return 'VIDEO';
      case EMediaCategory.contact:
        return 'CONTACT';
      case EMediaCategory.audio:
        return 'AUDIO';
      case EMediaCategory.document:
        return 'DOCUMENT';
      case EMediaCategory.application:
        return 'APPLICATION';
      case EMediaCategory.calendar:
        return 'CALENDAR';
      case EMediaCategory.unknown:
        return 'UNKNOWN';
    }
  }
  static EMediaCategory fromJson(String value) {
    switch (value.toUpperCase()) {
      case 'IMAGE':
        return EMediaCategory.image;
      case 'VIDEO':
        return EMediaCategory.video;
      case 'CONTACT':
        return EMediaCategory.contact;
      case 'AUDIO':
        return EMediaCategory.audio;
      case 'DOCUMENT':
        return EMediaCategory.document;
      case 'APPLICATION':
        return EMediaCategory.application;
      case 'CALENDAR':
        return EMediaCategory.calendar;
      default:
        return EMediaCategory.unknown;
    }
  }
}