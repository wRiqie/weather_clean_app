class DefaultResponseEntity<T> {
  bool isSuccess;
  T? data;
  String message;

  DefaultResponseEntity({
    required this.isSuccess,
    this.data,
    this.message = '',
  });
}
