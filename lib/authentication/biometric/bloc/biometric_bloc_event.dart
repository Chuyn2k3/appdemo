abstract class DataBiometricEvent {}

class FetchDataBiometric extends DataBiometricEvent {
  String? email;
  String? password;
  FetchDataBiometric({required this.email, required this.password});

  List<Object> get props => [email!, password!];
}
