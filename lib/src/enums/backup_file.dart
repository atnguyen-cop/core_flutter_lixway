enum EBackupFileStatus { active, inactive, blocked, deleted, edit }
extension EBackupFileStatusExt on EBackupFileStatus {
  String toJson() {
    switch (this) {
      case EBackupFileStatus.active:
        return 'ACTIVE';
      case EBackupFileStatus.inactive:
        return 'INACTIVE';
      case EBackupFileStatus.blocked:
        return 'BLOCKED';
      case EBackupFileStatus.deleted:
        return 'DELETED';
      case EBackupFileStatus.edit:
        return 'EDIT';
    }
  }
  static EBackupFileStatus fromJson(String value) {
    switch (value.toUpperCase()) {
      case 'ACTIVE':
        return EBackupFileStatus.active;
      case 'INACTIVE':
        return EBackupFileStatus.inactive;
      case 'BLOCKED':
        return EBackupFileStatus.blocked;
      case 'DELETED':
        return EBackupFileStatus.deleted;
      case 'EDIT':
        return EBackupFileStatus.edit;
      default:
        throw Exception('Unknown backup file status: $value');
    }
  }
}
enum EBackupFileSendStatus {
  success,
  failed,
}
extension EBackupFileSendStatusExt on EBackupFileSendStatus {
  String toJson() {
    switch (this) {
      case EBackupFileSendStatus.success:
        return 'SUCCESS';
      case EBackupFileSendStatus.failed:
        return 'FAILED';
    }
  }
  static EBackupFileSendStatus fromJson(String value) {
    switch (value.toUpperCase()) {
      case 'SUCCESS':
        return EBackupFileSendStatus.success;
      case 'FAILED':
        return EBackupFileSendStatus.failed;
      default:
        throw Exception('Unknown backup file send status: $value');
    }
  }
}