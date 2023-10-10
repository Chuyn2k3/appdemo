import 'package:appdemo/data/term/network_term.dart';
import 'package:appdemo/services/dio_base.dart';
import 'package:appdemo/services/store.dart';
import 'package:appdemo/user/model/user_model.dart';

class AuhthenticationRepo{

  static Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['access_token'];
    await Store.setToken(token);
  } 
  
  static Future<UserModel?> diologin(String email, String password) async {
    final dio = await DioBase.dioWithBaseOptionLogin();
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
}