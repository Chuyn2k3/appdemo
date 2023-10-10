import 'package:appdemo/services/api.dart';
import 'package:appdemo/devices/model/device_model.dart';

Future<List<DeviceData>?> getDataFromApi() async {
  final DeviceModel? apiResponse = await DemoAPI().dioGetDeviceData();
  final List<DeviceData> dataJsonList = apiResponse!.data!.toList();
  return dataJsonList;
}
