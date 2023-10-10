
class StatisticModel {
  int? departmentId;
  String? departmentTitle;
  int? brokenEquipmentsCount;
  int? repairingEquipmentsCount;

  StatisticModel({this.departmentId, this.departmentTitle, this.brokenEquipmentsCount, this.repairingEquipmentsCount});

  StatisticModel.fromJson(Map<String, dynamic> json) {
    if(json["departmentId"] is int) {
      departmentId = json["departmentId"];
    }
    if(json["departmentTitle"] is String) {
      departmentTitle = json["departmentTitle"];
    }
    if(json["brokenEquipmentsCount"] is int) {
      brokenEquipmentsCount = json["brokenEquipmentsCount"];
    }
    if(json["repairingEquipmentsCount"] is int) {
      repairingEquipmentsCount = json["repairingEquipmentsCount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["departmentId"] = departmentId;
    _data["departmentTitle"] = departmentTitle;
    _data["brokenEquipmentsCount"] = brokenEquipmentsCount;
    _data["repairingEquipmentsCount"] = repairingEquipmentsCount;
    return _data;
  }
}