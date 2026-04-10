class ApiResponse<T> {
  final String message;
  final T? data;
  ApiResponse({
    required this.message,
    this.data,
  });
  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) {
    return ApiResponse<T>(
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}