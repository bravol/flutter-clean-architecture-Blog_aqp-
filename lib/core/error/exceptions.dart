class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class UnknownException implements Exception {
  final String message;
  UnknownException(this.message);
}

class NoInternetException implements Exception {
  final String message;
  NoInternetException(this.message);
}

class NoDataException implements Exception {
  final String message;
  NoDataException(this.message);
}
