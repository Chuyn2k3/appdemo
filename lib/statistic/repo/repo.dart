import 'package:appdemo/data/term/network_term.dart';
import 'package:appdemo/services/dio_base.dart';
import 'package:appdemo/services/store.dart';
import 'package:appdemo/statistic/model/statistic_model.dart';
import 'package:dio/dio.dart';

class StatisticRepo {
  
  static Future<List<StatisticModel>?> getStatistic() async {
    try {
      final dio= await DioBase.dioWithBaseOption();
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
        final List<dynamic> jsonList = response.data;

        List<StatisticModel> result =
            jsonList.map((json) => StatisticModel.fromJson(json)).toList();
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
