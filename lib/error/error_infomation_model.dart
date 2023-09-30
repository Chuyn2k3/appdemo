
class ErrorInfomationModel {
  String? status;
  String? message;

  ErrorInfomationModel({this.status, this.message});

  ErrorInfomationModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}