import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maosul2/Features/home_layout/Home/home_view.dart';
import 'package:maosul2/Features/home_layout/profile/profile_view.dart';
import 'package:maosul2/Features/home_layout/orders/orders_view.dart';
import 'package:maosul2/Features/home_layout/stores/strores_view.dart';
import 'package:maosul2/Features/home_layout/cart/cart_view.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int langIndex = 0;
  void changeLangIndex({required int index}) {
    langIndex = index;
    emit(ChangeLangIndex());
  }

  int typeIndex = 0;
  void changeTypeIndex({required int index}) {
    typeIndex = index;
    emit(ChangeLangIndex());
  }

  double? lat = 0;
  double? lng = 0;
  String? address;
  void changeAddress({required String newAddress}) {
    address = newAddress;
    emit(ChangeIndex());
  }

  int currentIndex = 2;
  List<Widget> screens = [
    const StoresView(),
    const CartView(),
    const HomeView(),
    const OrdersView(),
    const ProfileView(),
  ];

  int screenIndex = 2;
  void changeScreenIndex({required int index}) {
    screenIndex = index;
    emit(ChangeScreenIndex());
  }

  int count = 0;
  void increseCount() {
    count++;
    emit(ChangeCount());
  }

  void decreseCount() {
    if (count != 0) {
      count--;
    }
    emit(ChangeCount());
  }

  int cartIndex = 0;
  void changeCartIndex({required int index}) {
    cartIndex = index;
    emit(ChangeIndexSuccess());
  }

  int paymentIndex = 0;
  void changePaymentIndex(index) async {
    paymentIndex = index;
    emit(ChangePaymentIndex());
  }

  int addressIndex = 0;
  void changeAddressIndex(index) async {
    addressIndex = index;
    emit(ChangeAddressIndex());
  }

  int orderStatusIndex = 0;
  void changeOrderStatusIndex({required int index}) {
    orderStatusIndex = index;
    emit(ChangeOrderStatusIndex());
  }

  List searchList = [];
  Future getSearch({required String title}) async {
    emit(GetSearchLoading());
  }
}
