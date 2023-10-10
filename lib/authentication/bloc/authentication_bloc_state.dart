import 'package:appdemo/user/model/user_model.dart';

abstract class DataAuthenticationState {}

class DataAuthenticationInitial extends DataAuthenticationState {}

class DataAuthenticationLoading extends DataAuthenticationState {}

class DataAuthenticationLoaded extends DataAuthenticationState {
  final UserModel data;
  DataAuthenticationLoaded({required this.data});
}

class DataAuthenticationError extends DataAuthenticationState {}

class DataAuthenticationErrorApi extends DataAuthenticationState {
  final String error;
  DataAuthenticationErrorApi({required this.error});
}

class DataAuthenticationErrorConnectivity extends DataAuthenticationState {
  String error;
  DataAuthenticationErrorConnectivity({required this.error});
}
