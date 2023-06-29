class Failure implements Exception {
  String message;
  String? stacktrace;

  Failure(this.message);
}
