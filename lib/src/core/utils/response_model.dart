class ResponseModel<L, R> {
  ResponseModel({
    required this.response,
    required this.error,
  });
  final L? response;
  final R? error;
}
