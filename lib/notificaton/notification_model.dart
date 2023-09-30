
class NotificationModel {
  int? status;
  List<Data>? data;
  int? total;

  NotificationModel({this.status, this.data, this.total});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is int) {
      status = json["status"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if(json["total"] is int) {
      total = json["total"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    return _data;
  }
}

class Data {
  String? id;
  String? type;
  int? notifiableId;
  String? notifiableType;
  Data1? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.type, this.notifiableId, this.notifiableType, this.data, this.readAt, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["notifiable_id"] is int) {
      notifiableId = json["notifiable_id"];
    }
    if(json["notifiable_type"] is String) {
      notifiableType = json["notifiable_type"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data1.fromJson(json["data"]);
    }
    if(json["read_at"] is String) {
      readAt = json["read_at"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    _data["notifiable_id"] = notifiableId;
    _data["notifiable_type"] = notifiableType;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["read_at"] = readAt;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Data1 {
  int? id;
  int? equipId;
  int? userId;
  String? content;

  Data1({this.id, this.equipId, this.userId, this.content});

  Data1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["equip_id"] is int) {
      equipId = json["equip_id"];
    }
    if(json["user_id"] is int) {
      userId = json["user_id"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["equip_id"] = equipId;
    _data["user_id"] = userId;
    _data["content"] = content;
    return _data;
  }
}