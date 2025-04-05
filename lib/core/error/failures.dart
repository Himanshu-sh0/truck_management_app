abstract class Failure {
  final String message;
  Failure(this.message);
}

class AuthFailure implements Failure {
  @override
  final String message;
  AuthFailure(this.message);
}

class ServerFailure implements Failure {
  @override
  final String message;
  final int code;
  ServerFailure(this.message, this.code);
}

class StorageFailure implements Failure {
  @override
  final String message;
  StorageFailure(this.message);
}
