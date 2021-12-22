class RestClienteResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;
  RestClienteResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
