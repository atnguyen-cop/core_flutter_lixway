import 'package:gun_core_flutter/gun_core_flutter.dart';

enum ELoadingType {
  none,
  initial,
  loading,
  refreshing,
  loadingMore,
  success,
  error,
}

final loadingValues = EnumValues({
  'none': ELoadingType.none,
  'initial': ELoadingType.initial,
  'loading': ELoadingType.loading,
  'refreshing': ELoadingType.refreshing,
  'loadingMore': ELoadingType.loadingMore,
  'success': ELoadingType.success,
  'error': ELoadingType.error,
});

extension ELoadingExtension on ELoadingType {
  String get name {
    switch (this) {
      case ELoadingType.none:
        return 'none';
      case ELoadingType.initial:
        return 'initial';
      case ELoadingType.loading:
        return 'loading';
      case ELoadingType.refreshing:
        return 'refreshing';
      case ELoadingType.loadingMore:
        return 'loadingMore';
      case ELoadingType.success:
        return 'success';
      case ELoadingType.error:
        return 'error';
    }
  }

  bool get isLoading {
    return this == ELoadingType.loading ||
        this == ELoadingType.initial ||
        this == ELoadingType.refreshing ||
        this == ELoadingType.loadingMore;
  }

  bool get isCompleted {
    return this == ELoadingType.success;
  }

  bool get hasError {
    return this == ELoadingType.error;
  }

  bool get isIdle {
    return this == ELoadingType.none;
  }
}