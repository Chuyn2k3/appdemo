import 'dart:convert';

import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/devices/model/device_model.dart';
import 'package:appdemo/departments/department_model.dart';
import 'package:appdemo/error/error_infomation_model.dart';
import 'package:appdemo/inventory/inventoryInformationModel.dart';
import 'package:appdemo/inventory/inventoryModel.dart';
import 'package:appdemo/notificaton/notification_model.dart';
import 'package:appdemo/services/get_info_env_file.dart';
import 'package:appdemo/data/term/network_term.dart';
import 'package:appdemo/statistic/model/statistic_model.dart';
import 'package:appdemo/user/model/logout_model.dart';
import 'package:appdemo/user/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:appdemo/services/store.dart';
import 'package:intl/intl.dart';

class DioBase {
  static Future<Dio> dioWithBaseOptionLogin() async {
    String apiUrl = await getLoginUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }

   static Future<Dio> dioWithBaseOption() async {
    String apiUrl = await getApiUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }

  static Map<String, dynamic> get _loginData =>
      {"email": "ibme.lab@gmail.com", "password": "12345689bvka"};

  static Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['access_token'];
    await Store.setToken(token);
  }

  static Future<UserModel?> diologin(String email, String password) async {
    final dio = await dioWithBaseOptionLogin();
    try {
      final response = await dio.post(
        ApiConstants.loginUrl,
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

  static Future<UserModel?> dioGetlogin() async {
    final dio = await dioWithBaseOptionLogin();
    try {
      final response = await dio.post(
        ApiConstants.loginUrl,
        data: _loginData,
      );
      await _saveToken(response.data);
      return UserModel.fromJson((response.data));
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<DeviceModel?> dioGetDeviceData() async {
    final dio = await dioWithBaseOption();
    try {
      dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await dio.get(
        ApiConstants.equipmentUrl,
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

  static Future<DepartmentModel?> dioGetDepartmentData() async {
    final dio = await dioWithBaseOption();
    try {
      final token = await Store.getToken();
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
        ApiConstants.departmentUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer $token",
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

  static Future<EmployeeModel?> dioGetEmployeeData() async {
    final dio = await dioWithBaseOption();
    try {
      dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await dio.get(
        ApiConstants.employeeUrl,
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

  static Future<ErrorInfomationModel?> reportErrorDevice (
      DeviceData device, String reason) async {
        final dio = await dioWithBaseOption();
    String dateTime = DateFormat('yyyy-MM-dd HH-mm-ss').format(DateTime.now());
    try {
      dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await dio.post(ApiConstants.reportErrorUrl + device.id.toString(),
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

  static Future<InventoryModel?> createInventoryDevice(
      DeviceData device, String note) async {
        final dio = await dioWithBaseOption();
    String dateTime = DateFormat('yyyy-MM-dd HH-mm-ss').format(DateTime.now());
    try {
      dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response =
          await dio.post(ApiConstants.createInventoryUrl + device.id.toString(),
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

  static Future<InventoryInformationModel?> dioGetInventoryInformation(
      DeviceData device) async {
        final dio = await dioWithBaseOption();
    try {
      dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await dio.get(
        ApiConstants.inventoryInformationUrl + device.id.toString(),
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

  static Future<NotificationModel?> dioGetNotificationData() async {
    final dio = await dioWithBaseOption();
    try {
      dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await dio.get(
        ApiConstants.notificationUrl,
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

  static Future<LogoutModel?> dioLogout() async {
    final dio = await dioWithBaseOption();
    try {
      dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await dio.post(ApiConstants.logoutUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ),
          data: {
            'email': await StoreLogin.getEmail(),
            'password': await StoreLogin.getPassword()
          });
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

  static Future<List<StatisticModel>?> getStatistic() async {
    final dio = await dioWithBaseOption();
    try {
      final token = await Store.getToken();
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
        ApiConstants.statisticUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        final List<dynamic> jsonList = jsonDecode(response.data);
        final List<StatisticModel> result = [];
        jsonList.forEach((json) {
          final statistic = StatisticModel.fromJson(json);
          result.add(statistic);
        });
        print(result);
        return result;
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
