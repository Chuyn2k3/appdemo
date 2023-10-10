import 'package:appdemo/authentication/biometric/bloc/biometric_bloc_event.dart';
import 'package:appdemo/authentication/biometric/bloc/biometric_bloc_state.dart';
import 'package:appdemo/authentication/repo/authentication_repro.dart';
import 'package:appdemo/data/term/app_term.dart';
import 'package:appdemo/user/model/user_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBiometricBloc extends Bloc<DataBiometricEvent, DataBiometricState> {
  DataBiometricBloc() : super(DataBiometricInitial()) {
    on<DataBiometricEvent>(
      (event, emit) async {
        if (event is FetchDataBiometric) {
          emit(DataBiometricLoading());
          try {
            String? email = event.email;
            String? password = event.password;
            final connectivityResult =
                await (Connectivity().checkConnectivity());
            if (connectivityResult == ConnectivityResult.wifi ||
                connectivityResult == ConnectivityResult.mobile) {
              if (email != null && password != null) {
                UserModel? data = await AuhthenticationRepo.diologin(email, password);
                if (data != null) {
                  emit(DataBiometricLoaded(data: data));
                } else {
                  emit(DataBiometricError());
                }
              } else {
                emit(DataBiometricErrorLoginFirst(
                    error: AppLoginTerm.needLoginFirst));
              }
            } else {
              emit(DataBiometricErrorConnectivity(
                  error: AppLoginTerm.notConnectivityWifi));
            }
          } catch (e) {
            emit(DataBiometricErrorApi(error: e.toString()));
          }
        }
      },
    );
  }
}
