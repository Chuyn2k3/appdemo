import "package:appdemo/statistic/bloc/statistic_bloc_event.dart";
import "package:appdemo/statistic/bloc/statistic_bloc_state.dart";
import "package:appdemo/statistic/model/statistic_model.dart";
import "package:appdemo/statistic/repo/repo.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class DataStatisticBloc extends Bloc<DataStatisticEvent, DataStatisticState> {
  DataStatisticBloc() : super(DataStatisticInitial()) {
    on<DataStatisticEvent>((event, emit) async {
      if (event is FetchDataStatistic) {
        emit(DataStatisticLoading());
        try {
          List<StatisticModel>? data = await StatisticRepo.getStatistic();
          if (data != null) {
            emit(DataStatisticLoaded(data: data));
          }
        } catch (e) {
          emit(DataStatisticError(error: e.toString()));
        }
      }
    });
  }
}
