import 'package:appdemo/authentication/bloc/authentication_bloc_event.dart';
import 'package:appdemo/authentication/bloc/authentication_bloc_state.dart';
import 'package:appdemo/authentication/repo/authentication_repro.dart';
import 'package:appdemo/data/term/app_term.dart';
import 'package:appdemo/user/model/user_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataAuthenticationBloc
    extends Bloc<DataAuthenticationEvent, DataAuthenticationState> {
  DataAuthenticationBloc() : super(DataAuthenticationInitial()) {
    on<DataAuthenticationEvent>(
      (event, emit) async {
        if (event is FetchDataLogin) {
          emit(DataAuthenticationLoading());
          try {
            String email = event.email;
            String password = event.password;
            final connectivityResult =
                await (Connectivity().checkConnectivity());
            if (connectivityResult == ConnectivityResult.wifi ||
                connectivityResult == ConnectivityResult.mobile) {
              UserModel? data = await AuhthenticationRepo.diologin(email, password);
              if (data != null) {
                emit(DataAuthenticationLoaded(data: data));
              } else {
                emit(DataAuthenticationError());
              }
            } else {
              emit(DataAuthenticationErrorConnectivity(error: AppLoginTerm.notConnectivityWifi));
            }
          } catch (e) {
            emit(DataAuthenticationErrorApi(error: e.toString()));
          }
        }
      },
    );
  }
}
