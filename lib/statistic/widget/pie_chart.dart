import 'package:appdemo/devices/statusDevices.dart';
import 'package:appdemo/statistic/bloc/static_bloc.dart';
import 'package:appdemo/statistic/bloc/statistic_bloc_event.dart';
import 'package:appdemo/statistic/model/statistic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import '../bloc/statistic_bloc_state.dart';

Widget showPieChart(
  DataStatisticBloc dataBloc,
  String department,
) {
  List<StatisticModel> searchOnDepartmentDevice(List<StatisticModel> data) {
    if (department != all) {
      final suggestions = data.where((element) {
        final _department = element.departmentTitle!.toLowerCase();
        final input = department.toLowerCase();
        return _department.contains(input);
      }).toList();
      return suggestions;
    }
    return data;
  }

  dataBloc.add(FetchDataStatistic());
  return BlocBuilder<DataStatisticBloc, DataStatisticState>(
      builder: (context, state) {
    if (state is DataStatisticLoading) {
      return const CircularProgressIndicator();
    } else if (state is DataStatisticLoaded) {
      Map<String, double> dataMap = {};
      for (var statistic in searchOnDepartmentDevice(state.data)) {
        dataMap[statistic.departmentTitle!] =
            statistic.brokenEquipmentsCount!.toDouble();
      }
      double totalValue = dataMap.values.reduce((a, b) => a + b);
      Map<String, String> customLegendLabels = {};
      dataMap.forEach((key, value) {
        customLegendLabels[key] =
            "$key: ${value.toStringAsFixed(0)} thiết bị (${(value / totalValue).toStringAsFixed(1)}%) ";
      });
      return customizePieChart(context, state.data, department);
    } else if (state is DataStatisticError) {
      return Column(
        children: [
          Text('Error:${state.error}'),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                dataBloc.add(FetchDataStatistic());
              },
              child: const Text('Tải lại'))
        ],
      );
    } else
      return TextButton(
          onPressed: () {
            dataBloc.add(FetchDataStatistic());
          },
          child: const Text('Tải lại'));
  });
}

Widget customizePieChart(
    BuildContext context, List<StatisticModel> dataState, String department) {
  List<StatisticModel> searchOnDepartmentDevice(List<StatisticModel> data) {
    if (department != all) {
      final suggestions = data.where((element) {
        final _department = element.departmentTitle!.toLowerCase();
        final input = department.toLowerCase();
        return _department.contains(input);
      }).toList();
      return suggestions;
    }
    return data;
  }

  Map<String, double> dataMap = {};
  for (var statistic in searchOnDepartmentDevice(dataState)) {
    dataMap[statistic.departmentTitle!] =
        statistic.brokenEquipmentsCount!.toDouble();
  }
  double totalValue = dataMap.values.reduce((a, b) => a + b);
  Map<String, String> customLegendLabels = {};
  dataMap.forEach((key, value) {
    customLegendLabels[key] =
        "$key: ${value.toStringAsFixed(0)} thiết bị (${(value / totalValue).toStringAsFixed(1)}%) ";
  });
  return PieChart(
    dataMap: dataMap,
    chartRadius: MediaQuery.of(context).size.width / 1.1,
    chartType: ChartType.disc,
    ringStrokeWidth: 32,
    formatChartValues: (value) {
      String get() {
        String result = '';
        dataMap.forEach((key, _value) {
          if (value == _value) result = key;
        });
        return result;
      }

      return get() +
          "\n" +
          value.toStringAsFixed(0) +
          "\n" +
          ((value / totalValue) * 100).toStringAsFixed(1) +
          '%'; // Định dạng giá trị hiển thị
    },
    legendOptions: const LegendOptions(
      showLegends: true,
      legendPosition: LegendPosition.bottom,
      showLegendsInRow: false,
    ),
    legendLabels: customLegendLabels,
    chartValuesOptions: const ChartValuesOptions(
      showChartValueBackground: false,
      showChartValues: true,
      showChartValuesInPercentage: false,
      showChartValuesOutside: false,
      chartValueStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
