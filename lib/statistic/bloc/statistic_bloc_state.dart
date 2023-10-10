import 'package:appdemo/statistic/model/statistic_model.dart';

abstract class DataStatisticState {}

class DataStatisticInitial extends DataStatisticState {}

class DataStatisticLoading extends DataStatisticState {}

class DataStatisticLoaded extends DataStatisticState {
  final List<StatisticModel> data;
  DataStatisticLoaded({required this.data});
}

class DataStatisticError extends DataStatisticState {
  final String error;
  DataStatisticError({required this.error});
}
