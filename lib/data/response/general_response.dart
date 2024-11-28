

class GeneralResponse {
  String? status;
  String? message;

  GeneralResponse({
    this.status,
    this.message,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) => GeneralResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };


}
