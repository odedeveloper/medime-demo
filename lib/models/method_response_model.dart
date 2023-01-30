class MethodResponse {
  bool? isSuccess;
  String? errorMessage;
  String? errorDescription;
  MethodResponse({
    this.isSuccess = false,
    this.errorMessage,
    this.errorDescription,
  });
}
