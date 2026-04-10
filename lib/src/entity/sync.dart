class SyncEntity {
  final SyncItemEntity images;
  final SyncItemEntity videos;
  final SyncItemEntity audios;
  final SyncItemEntity documents;
  final SyncItemEntity contact;
  final SyncItemEntity setting;
  final SyncItemEntity calendar;
  SyncEntity({
    required this.images,
    required this.videos,
    required this.audios,
    required this.documents,
    required this.contact,
    required this.setting,
    required this.calendar,
  });
  copyWith({
    SyncItemEntity? images,
    SyncItemEntity? videos,
    SyncItemEntity? audios,
    SyncItemEntity? documents,
    SyncItemEntity? contact,
    SyncItemEntity? setting,
    SyncItemEntity? calendar,
  }) {
    return SyncEntity(
      images: images ?? this.images,
      videos: videos ?? this.videos,
      audios: audios ?? this.audios,
      documents: documents ?? this.documents,
      contact: contact ?? this.contact,
      setting: setting ?? this.setting,
      calendar: calendar ?? this.calendar,
    );
  }
}
class SyncItemEntity  {
  final int totalCount;
  final int syncedCount;
  final int totalSyncCount;
  final int totalSyncedCount;
  SyncItemEntity ({
    required this.totalCount,
    required this.syncedCount,
    required this.totalSyncCount,
    required this.totalSyncedCount,
  });
  copyWith({
    int? totalCount,
    int? syncedCount,
    int? totalSyncCount,
    int? totalSyncedCount,
  }) {
    return SyncItemEntity(
      totalCount: totalCount ?? this.totalCount,
      syncedCount: syncedCount ?? this.syncedCount,
      totalSyncCount: totalSyncCount ?? this.totalSyncCount,
      totalSyncedCount: totalSyncedCount ?? this.totalSyncedCount,
    );
  }
}