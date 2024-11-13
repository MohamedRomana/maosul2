part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangeSecureIcon extends AuthState {}

final class ChangeSecureIcon2 extends AuthState {}

final class ChangeSecureLoginIcon extends AuthState {}

final class ChangePassowrdSecureIcon extends AuthState {}

final class ConfirmPassowrdSecureIcon extends AuthState {}

final class ChooseImageSuccess extends AuthState {}

final class RemoveImageSuccess extends AuthState {}

final class ChangeAgreeTerms extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String message;
  RegisterSuccess({required this.message});
}

final class RegisterFailure extends AuthState {
  final String error;
  RegisterFailure({required this.error});
}

final class OTPLoading extends AuthState {}

final class OTPSuccess extends AuthState {}

final class OTPFailure extends AuthState {
  final String error;
  OTPFailure({required this.error});
}

final class LogInLoading extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInFailure extends AuthState {
  final String error;
  LogInFailure({required this.error});
}

final class ForgetPassLoading extends AuthState {}

final class ForgetPassSuccess extends AuthState {
  final String message;
  ForgetPassSuccess({required this.message});
}

final class ForgetPassFailure extends AuthState {
  final String error;
  ForgetPassFailure({required this.error});
}

final class ResetPassLoading extends AuthState {}

final class ResetPassSuccess extends AuthState {
  final String message;
  ResetPassSuccess({required this.message});
}

final class ResetPassFailure extends AuthState {
  final String error;
  ResetPassFailure({required this.error});
}

final class ProviderRegisterLoading extends AuthState {}

final class ProviderRegisterSuccess extends AuthState {
  final String message;
  ProviderRegisterSuccess({required this.message});
}

final class ProviderRegisterFailure extends AuthState {
  final String error;
  ProviderRegisterFailure({required this.error});
}

final class UploadImageLoading extends AuthState {}

final class UploadImageSuccess extends AuthState {}

final class UploadImageFailure extends AuthState {}
