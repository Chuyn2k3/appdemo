abstract class DataAuthenticationEvent {}

class FetchDataLogin extends DataAuthenticationEvent {
  final String email;
  final String password;
  FetchDataLogin({required this.email, required this.password});
  List<Object> get props => [email, password];
}
