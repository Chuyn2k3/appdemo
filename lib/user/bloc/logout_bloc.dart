import 'package:appdemo/data/term/app_term.dart';
import 'package:appdemo/user/bloc/logout_bloc_event.dart';
import 'package:appdemo/user/bloc/logout_bloc_state.dart';
import 'package:appdemo/user/model/logout_model.dart';
import 'package:appdemo/user/repo/logout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataLogoutBloc extends Bloc<DataLogoutEvent, DataLogoutState> {
  DataLogoutBloc() : super(DataLogoutInitial()) {
    on<DataLogoutEvent>(
      (event, emit) async {
        if (event is FetchLogout) {
          emit(DataLogoutLoading());
          try {
            LogoutModel? data = await LogoutRepo.dioLogout();
            if (data != null) {
              emit(DataLogoutLoaded(data: data));
            } else {
              emit(DataLogoutError(error: AppLogoutTerm.logoutError));
            }
          } catch (e) {
            emit(DataLogoutError(error: e.toString()));
          }
        }
      },
    );
  }
}
