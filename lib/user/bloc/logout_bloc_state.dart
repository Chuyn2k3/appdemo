import 'package:appdemo/user/model/logout_model.dart';

abstract class DataLogoutState {}

class DataLogoutInitial extends DataLogoutState {}

class DataLogoutLoading extends DataLogoutState {}

class DataLogoutLoaded extends DataLogoutState {
  LogoutModel data;
  DataLogoutLoaded({required this.data});
}

class DataLogoutError extends DataLogoutState {
  String error;
  DataLogoutError({required this.error});
}
