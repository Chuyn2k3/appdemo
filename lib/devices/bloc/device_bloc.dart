import 'package:appdemo/data/term/app_term.dart';
import 'package:appdemo/devices/bloc/device_bloc_event.dart';
import 'package:appdemo/devices/bloc/device_bloc_state.dart';
import 'package:appdemo/devices/model/device_model.dart';
import 'package:appdemo/services/dio_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataDeviceBloc extends Bloc<DataDeviceEvent, DataDeviceState> {
  DataDeviceBloc() : super(DataDeviceInitial()) {
    on<DataDeviceEvent>(
      (event, emit) async {
        if (event is LoadData) {
          emit(DataDeviceLoading());
          try {
            DeviceModel? data = await DioBase.dioGetDeviceData();
            if (data != null) {
              emit(DataDeviceLoaded(data: data));
            } else {
              emit(DataDeviceErrorApi(error: AppDeviceTerm.errorData));
            }
          } catch (e) {
            emit(DataDeviceError());
          }
        }
      },
    );
  }
  
  static DataDeviceBloc get(context) => BlocProvider.of(context);
  late List<DeviceData> device;
  void getDeviceData() async {
    DeviceModel? data = await DioBase.dioGetDeviceData();
    device = data!.data!;
  }
}
