import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/devices/device_model.dart';
import 'package:appdemo/departments/department_model.dart';
import 'package:appdemo/error/error_infomation_model.dart';
import 'package:appdemo/inventory/inventoryInformationModel.dart';
import 'package:appdemo/inventory/inventoryModel.dart';
import 'package:appdemo/notificaton/notification_model.dart';
import 'package:appdemo/user/logout_model.dart';
import 'package:appdemo/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:appdemo/services/store.dart';
import 'package:intl/intl.dart';

class DemoAPI {
  late final Dio _dio;
  DemoAPI() {
    _dio = Dio();
  }
  final String _loginUrl = 'http://bvdemo.qltbyt.com/api/login';
  final String _dataUrl = 'http://bvdemo.qltbyt.com/api/v1/equipments';
  final String _departmentUrl = 'http://bvdemo.qltbyt.com/api/v1/departments';
  final String _employeeUrl = 'http://bvdemo.qltbyt.com/api/v1/users';
  final String _reportErrorUrl = 'http://bvdemo.qltbyt.com/api/v1/equipment/';
  final String _notificationUrl =
      'http://bvdemo.qltbyt.com/api/v1/notification';
  final String _createInventoryUrl =
      'http://bvdemo.qltbyt.com/api/v1/createInventory/';

  final String _inventoryInformationUrl =
      'http://bvdemo.qltbyt.com/api/v1/listInventoryByEquipmentID/';
  final String _logoutUrl = 'http://bvdemo.qltbyt.com/api/v1/logout';
  Map<String, dynamic> get _loginData =>
      {"email": "ibme.lab@gmail.com", "password": "12345689bvka"};

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['access_token'];
    await Store.setToken(token);
  }

  Future<UserModel?> diologin(String email, String password) async {
    try {
      final response = await _dio.post(
        _loginUrl,
        data: {"email": email, "password": password},
      );
      await _saveToken(response.data);
      return UserModel.fromJson((response.data));
    } catch (e) {
      // ignore_for_file: avoid_print
      print(e);
    }
    return null;
  }

  Future<UserModel?> dioGetlogin() async {
    try {
      final response = await _dio.post(
        _loginUrl,
        data: _loginData,
      );
      await _saveToken(response.data);
      return UserModel.fromJson((response.data));
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<DeviceModel?> dioGetDeviceData() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.get(
        _dataUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return DeviceModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<DepartmentModel?> dioGetDepartmentData() async {
    try {
      _dio.options.headers['Authorization'] =
          'Bearer ${await Store.getToken()}';
      final response = await _dio.get(
        _departmentUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return DepartmentModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<EmployeeModel?> dioGetEmployeeData() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.get(
        _employeeUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return EmployeeModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ErrorInfomationModel?> reportErrorDevice(
      DeviceData device, String reason) async {
    String dateTime = DateFormat('yyyy-MM-dd HH-mm-ss').format(DateTime.now());
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.post(_reportErrorUrl + device.id.toString(),
          options: Options(
            method: 'post',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ),
          data: {"date_failure": dateTime, "reason": reason});
      try {
        return ErrorInfomationModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<InventoryModel?> createInventoryDevice(
      DeviceData device, String note) async {
    String dateTime = DateFormat('yyyy-MM-dd HH-mm-ss').format(DateTime.now());
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response =
          await _dio.post(_createInventoryUrl + device.id.toString(),
              options: Options(
                method: 'post',
                headers: {
                  "Authorization": "Bearer ${await Store.getToken()}",
                  "Content-Type": "application/json",
                },
              ),
              data: {"date_delivery": dateTime, "note": note});
      try {
        return InventoryModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<InventoryInformationModel?> dioGetInventoryInformation(
      DeviceData device) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.get(
        _inventoryInformationUrl + device.id.toString(),
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return InventoryInformationModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<NotificationModel?> dioGetNotificationData() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.get(
        _notificationUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return NotificationModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<LogoutModel?> dioLogout() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.post(
        _logoutUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
        data: {'email':await StoreLogin.getEmail(),'password':await StoreLogin.getPassword()}
      );
      try {
        return LogoutModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
