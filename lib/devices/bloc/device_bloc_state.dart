import 'package:appdemo/devices/model/device_model.dart';

abstract class DataDeviceState {}

class DataDeviceInitial extends DataDeviceState {}

class DataDeviceLoading extends DataDeviceState {}

class DataDeviceLoaded extends DataDeviceState {
  DeviceModel data;
  DataDeviceLoaded({required this.data});
}

class DataDeviceReload extends DataDeviceState {}

class DataDeviceError extends DataDeviceState {}

class DataDeviceErrorApi extends DataDeviceState {
  String error;
  DataDeviceErrorApi({required this.error});
}
