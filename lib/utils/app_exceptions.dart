class AppException implements Exception {
  final message;
  AppException({this.message});

  String toString() {
    return "$message";
  }
}

class UnAuthorizedException extends AppException {
  String message;
  UnAuthorizedException({required this.message});
}

class UnKnownException extends AppException {
  String message;
  UnKnownException({required this.message});
}

class FailureException extends AppException {
  String message;
  FailureException({required this.message});
}

class NotFoundException extends AppException {
  String message;
  NotFoundException({required this.message});
}