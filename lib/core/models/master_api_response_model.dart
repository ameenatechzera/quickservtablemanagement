class ApiResponseModel {
  final int status;
  final bool error;
  final String message;
  ApiResponseModel({
    required this.status,
    required this.error,
    required this.message,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      status: json['status'] ?? 0,
      error: json['error'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
