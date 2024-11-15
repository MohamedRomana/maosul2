// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maosul2/Features/home_layout/Home/home_view.dart';
import 'package:maosul2/Features/home_layout/profile/profile_view.dart';
import 'package:maosul2/Features/home_layout/orders/orders_view.dart';
import 'package:maosul2/Features/home_layout/stores/strores_view.dart';
import 'package:maosul2/Features/home_layout/cart/cart_view.dart';
import 'package:http/http.dart' as http;
import 'package:maosul2/core/location/location_helper.dart';
import '../cache/cache_helper.dart';
import '../constants.dart';
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

  List sliders = [];
  List sections = [];
  List best_providers = [];
  List near_providers = [];

  Future homeData() async {
    emit(GetHomeDataLoading());
    http.Response response = await http.post(Uri.parse('${baseUrl}api/home'),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId()
        });

    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data["data"].toString());

    if (data["key"] == 1) {
      sliders = data["data"]["sliders"];
      sections = data["data"]["sections"];
      best_providers = data["data"]["best_providers"];
      near_providers = data["data"]["near_providers"];
      notificationCount = data["notification_count"];
      emit(GetHomeDataSuccess());
    } else {
      emit(GetHomeDataFailure(message: data["msg"]));
    }
  }

  String homeAddress = '';

  getCurrentLocation() async {
    emit(GetCurrentLocationLoading());
    Position? position = await LocationHelper.determinePosition();
    final Placemark =
        await placemarkFromCoordinates(position!.latitude, position.longitude);
    homeAddress = Placemark[0].street!;
    lat = position.latitude;
    lng = position.longitude;
    emit(GetHomeDataSuccess());
  }

  List showNotification = [];
  int notificationCount = 0;

  Future showNotificationData() async {
    emit(GetNotificationLoading());
    http.Response response = await http
        .post(Uri.parse('${baseUrl}api/show-notification'), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId()
    });

    Map<String, dynamic> data = jsonDecode(response.body);

    if (data["key"] == 1) {
      showNotification = data["data"];
      notificationCount = data['notification_count'];
      emit(GetNotificationSuccess());
      debugPrint(showNotification.toString());
    } else {
      emit(GetNotificationFailure(message: data["msg"]));
    }
  }

  Future deleteNotificationData(
      {required String id, required int index}) async {
    emit(DeleteNotificationLoading());
    http.Response response = await http.post(
        Uri.parse('${baseUrl}api/delete-notification'),
        body: {"lang": CacheHelper.getLang(), "id": id});
    Map<String, dynamic> data = jsonDecode(response.body);

    if (data["key"] == 1) {
      showNotification.removeAt(index);
      emit(DeleteNotificationSuccess());
    } else {
      emit(DeleteNotificationFailure(message: data["msg"]));
    }
  }

  List storesList = [];
  Future storessData({String sectionId = ""}) async {
    emit(GetProvidersLoading());
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/providers'), body: {
      "lang": CacheHelper.getLang(),
      "section_id": sectionId,
      "lat": lat.toString(),
      "lng": lng.toString(),
    });

    Map<String, dynamic> data = jsonDecode(response.body);

    if (data["key"] == 1) {
      storesList = data["data"];
      emit(GetProvidersSuccess());
    } else {
      emit(GetProvidersFailure(message: data["msg"]));
    }
  }

  Map storeData = {};
  List subSections = [];
  List products = [];
  Future getStoreData({required String providerId}) async {
    emit(GetStoresDataLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/show-provider"),
        body: {
          "lang": CacheHelper.getLang(),
          "provider_id": providerId,
          "lat": lat.toString(),
          "lng": lng.toString(),
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          storeData = data["data"];
          products = data["data"]["services"];

          if (data["data"]["sub_sections"].length == 1) {
            subSections = data["data"]["sub_sections"];
          } else {
            subSections = [
              {"id": 0, "title": "الكل"}
            ];
            subSections.addAll(data["data"]["sub_sections"]);
          }

          debugPrint(storeData.toString());
          emit(GetStoresDataSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(GetStoresDataFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(GetStoresDataFailure(error: error.toString()));
      }
    }
  }

  Map productData = {};
  Future getProductData({required String serviceId, bool isFav = false}) async {
    if (!isFav) {
      emit(GetProductDataLoading());
    } else {
      emit(AddFavLoading());
    }

    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/show-service"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
          "service_id": serviceId,
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          productData = data["data"];
          debugPrint(productData.toString());

          emit(GetProductDataSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(GetProductDataFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(GetProductDataFailure(error: error.toString()));
      }
    }
  }


}
