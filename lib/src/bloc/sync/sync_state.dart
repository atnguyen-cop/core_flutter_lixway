import 'package:gun_core_flutter/src/enums/sync.dart';
import 'package:gun_core_flutter/src/enums/media.dart';
import 'package:gun_core_flutter/src/entity/sync.dart';
abstract class SyncState {}
class SyncInitialState extends SyncState {}
class SyncCheckingState extends SyncState {
  SyncCheckingState();
}
class SyncLoadingState extends SyncState {}
class SyncErrorState extends SyncState {
  final String message;
  SyncErrorState(this.message);
}
class SyncUploadingState extends SyncState {
  final SyncEntity syncEntity;
  final Map<EMediaType, Map<String, ESyncStatus>> syncItems;
  SyncUploadingState({
    required this.syncEntity,
    Map<EMediaType, Map<String, ESyncStatus>>? syncItems = const {},
  }): syncItems = syncItems ?? <EMediaType, Map<String, ESyncStatus>>{};
  SyncUploadingState copyWith({
    SyncEntity? syncEntity,
    Map<EMediaType, Map<String, ESyncStatus>>? syncItems,
  }) {
    return SyncUploadingState(
      syncEntity: syncEntity ?? this.syncEntity,
      syncItems: syncItems ?? this.syncItems,
    );
  }
}
class SyncSuccessState extends SyncState {
  final SyncEntity syncEntity;
  final Map<EMediaType, Map<String, ESyncStatus>> syncItems;
  SyncSuccessState({
    required this.syncEntity,
    Map<EMediaType, Map<String, ESyncStatus>>? syncItems = const {},
  }): syncItems = syncItems ?? <EMediaType, Map<String, ESyncStatus>>{};
  SyncSuccessState copyWith({
    SyncEntity? syncEntity,
    Map<EMediaType, Map<String, ESyncStatus>>? syncItems,
  }) {
    return SyncSuccessState(
      syncEntity: syncEntity ?? this.syncEntity,
      syncItems: syncItems ?? this.syncItems,
    );
  }
}
class SyncPausedState extends SyncState {
  final SyncEntity syncEntity;
  final Map<EMediaType, Map<String, ESyncStatus>> syncItems;
  SyncPausedState({
    required this.syncEntity,
    Map<EMediaType, Map<String, ESyncStatus>>? syncItems = const {},
  }): syncItems = syncItems ?? <EMediaType, Map<String, ESyncStatus>>{};
}