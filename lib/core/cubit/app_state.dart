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


