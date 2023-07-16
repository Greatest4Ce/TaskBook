class UnknownException implements Exception {
  UnknownException();
  static const String message = 'NoInternetException';
  @override
  String toString() => message;
}
