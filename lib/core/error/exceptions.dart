class ServerException implements Exception {
  final String message;

  ServerException({this.message = "Server error"});
}

class EmptyCacheException implements Exception {
  final String message;

  EmptyCacheException([this.message = "Cache is empty"]);
}

class EmptyServerListException implements Exception {
  final String message;

  EmptyServerListException([this.message = "Empty server list"]);
}

class OfflineException implements Exception {
  final String message;

  OfflineException([this.message = "Device is offline"]);
}
