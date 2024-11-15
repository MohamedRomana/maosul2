part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class ChangeLangIndex extends AppState {}

final class ChangeBottomNav extends AppState {}

final class ChangeScreenIndex extends AppState {}

final class ChangeCount extends AppState {}

final class ChangePaymentIndex extends AppState {}

final class ChangeAddressIndex extends AppState {}

final class ChangeIndexSuccess extends AppState {}

final class ChangeOrderStatusIndex extends AppState {}

final class GetSearchLoading extends AppState {}

final class ChangeIndex extends AppState {}

final class GetHomeDataLoading extends AppState {}

final class GetHomeDataSuccess extends AppState {
  final String? message;

  GetHomeDataSuccess({this.message});
}

final class GetHomeDataFailure extends AppState {
  final String? message;

  GetHomeDataFailure({this.message});
}

final class GetCurrentLocationLoading extends AppState {}

final class GetCurrentLocationFailure extends AppState {}

final class GetNotificationLoading extends AppState {}

final class GetNotificationSuccess extends AppState {}

final class GetNotificationFailure extends AppState {
  final String? message;

  GetNotificationFailure({this.message});
}

final class DeleteNotificationLoading extends AppState {}

final class DeleteNotificationSuccess extends AppState {}

final class DeleteNotificationFailure extends AppState {
  final String? message;

  DeleteNotificationFailure({this.message});
}

final class GetProvidersLoading extends AppState {}

final class GetProvidersSuccess extends AppState {}

final class GetProvidersFailure extends AppState {
  final String? message;

  GetProvidersFailure({this.message});
}

final class GetStoresDataLoading extends AppState {}

final class GetStoresDataSuccess extends AppState {}

final class GetStoresDataFailure extends AppState {
  final String error;
  GetStoresDataFailure({required this.error});
}

final class ServerError extends AppState {}

final class Timeoutt extends AppState {}


final class GetProductDataLoading extends AppState {}

final class GetProductDataSuccess extends AppState {}

final class GetProductDataFailure extends AppState {
  final String error;
  GetProductDataFailure({required this.error});
}
final class AddFavLoading extends AppState {}

final class AddFavSuccess extends AppState {}

final class AddFavFailure extends AppState {
  final String error;
  AddFavFailure({required this.error});
}