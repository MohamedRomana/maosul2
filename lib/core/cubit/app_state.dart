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

final class GetSearchSuccess extends AppState {}

final class GetSearchFailure extends AppState {
  final String error;
  GetSearchFailure({required this.error});
}

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

final class GetProductsLoading extends AppState {}

final class GetProductsSuccess extends AppState {}

final class GetProductsFailure extends AppState {
  final String error;
  GetProductsFailure({required this.error});
}

final class AddToCartLoading extends AppState {}

final class AddToCartSuccess extends AppState {
  final String message;

  AddToCartSuccess({required this.message});
}

final class AddToCartFailure extends AppState {
  final String error;
  AddToCartFailure({required this.error});
}

final class ChangeAddToCartIndex extends AppState {}

final class ShowCartLoading extends AppState {}

final class ShowCartSuccess extends AppState {}

final class ShowCartFailure extends AppState {
  final String error;
  ShowCartFailure({required this.error});
}

final class UpdateCartLoading extends AppState {}

final class UpdateCartSuccess extends AppState {}

final class UpdateCartFailure extends AppState {
  final String error;
  UpdateCartFailure({required this.error});
}

final class StoreOrderLoading extends AppState {}

final class StoreOrderSuccess extends AppState {
  final String message;
  StoreOrderSuccess({required this.message});
}

final class StoreOrderFailure extends AppState {
  final String error;
  StoreOrderFailure({required this.error});
}

final class ShowOrdersLoading extends AppState {}

final class ShowOrdersSuccess extends AppState {}

final class ShowOrdersFailure extends AppState {
  final String error;
  ShowOrdersFailure({required this.error});
}

final class ShowFavLoading extends AppState {}

final class ShowFavSuccess extends AppState {}

final class ShowFavFailure extends AppState {
  final String error;
  ShowFavFailure({required this.error});
}

final class RemoveFavLoading extends AppState {}

final class RemoveFavSuccess extends AppState {}

final class RemoveFavFailure extends AppState {
  final String error;
  RemoveFavFailure({required this.error});
}

final class ShowUserLoading extends AppState {}

final class ShowUserSuccess extends AppState {}

final class ShowUserFailure extends AppState {
  final String error;
  ShowUserFailure({required this.error});
}

final class UpdateProfileLoading extends AppState {}

final class UpdateProfileSuccess extends AppState {
  final String message;
  UpdateProfileSuccess({required this.message});
}

final class UpdateProfileFailure extends AppState {
  final String error;
  UpdateProfileFailure({required this.error});
}

final class ShowProviderOrdersLoading extends AppState {}

final class ShowProviderOrdersSuccess extends AppState {}

final class ShowProviderOrdersFailure extends AppState {
  final String error;
  ShowProviderOrdersFailure({required this.error});
}

final class ChangeOrderStatusLoading extends AppState {}

final class ChangeOrderStatusSuccess extends AppState {
  final String message;

  ChangeOrderStatusSuccess({required this.message});
}

final class ChangeOrderStatusFailure extends AppState {
  final String error;
  ChangeOrderStatusFailure({required this.error});
}

final class ChooseImageSuccess extends AppState {}

final class RemoveImageSuccess extends AppState {}

final class ContactUsLoading extends AppState {}

final class ContactUsSuccess extends AppState {
  final String message;

  ContactUsSuccess({required this.message});
}

final class ContactUsFailure extends AppState {
  final String error;
  ContactUsFailure({required this.error});
}

final class AboutAppLoading extends AppState {}

final class AboutAppSuccess extends AppState {}

final class AboutAppFailure extends AppState {}

final class ConditionLoading extends AppState {}

final class ConditionSuccess extends AppState {}

final class ConditionFailure extends AppState {}

final class UploadImageLoading extends AppState {}

final class UploadImageSuccess extends AppState {}

final class UploadImageFailure extends AppState {}

final class UpdateProviderProfileLoading extends AppState {}

final class UpdateProviderProfileSuccess extends AppState {
  final String message;
  UpdateProviderProfileSuccess({required this.message});
}

final class UpdateProviderProfileFailure extends AppState {
  final String error;
  UpdateProviderProfileFailure({required this.error});
}
