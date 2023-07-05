class NotInternetException implements Exception {
  NotInternetException();
  static const String message = 'NoInternetException';
  @override
  String toString() => message;
}
