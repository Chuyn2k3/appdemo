import 'package:appdemo/user/model/user_model.dart';

abstract class DataBiometricState {}

class DataBiometricInitial extends DataBiometricState {}

class DataBiometricLoading extends DataBiometricState {}

class DataBiometricLoaded extends DataBiometricState {
  UserModel data;
  DataBiometricLoaded({required this.data});
}

class DataBiometricError extends DataBiometricState {}

class DataBiometricErrorApi extends DataBiometricState {
  String error;
  DataBiometricErrorApi({required this.error});
}

class DataBiometricErrorConnectivity extends DataBiometricState {
  String error;
  DataBiometricErrorConnectivity({required this.error});
}

class DataBiometricErrorLoginFirst extends DataBiometricState {
  String error;
  DataBiometricErrorLoginFirst({required this.error});
}