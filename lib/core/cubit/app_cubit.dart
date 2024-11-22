// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
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
  List<File> identityImage = [];
  Future<void> getIdentityImage() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    identityImage = pickedImages
        .map((pickedImage) => File(pickedImage.path))
        .take(1)
        .toList();
    emit(ChooseImageSuccess());
  }

  void removeIdentityImage() {
    identityImage.clear();
    emit(RemoveImageSuccess());
  }

  List<File> licenseImage = [];
  Future<void> getLicenseImage() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    licenseImage = pickedImages
        .map((pickedImage) => File(pickedImage.path))
        .take(1)
        .toList();
    emit(ChooseImageSuccess());
  }

  void removeLicenseImage() {
    licenseImage.clear();
    emit(RemoveImageSuccess());
  }

  List<File> carImage = [];
  Future<void> getCarImage() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    carImage = pickedImages
        .map((pickedImage) => File(pickedImage.path))
        .take(1)
        .toList();
    emit(ChooseImageSuccess());
  }

  void removeCarImage() {
    carImage.clear();
    emit(RemoveImageSuccess());
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

  int count = 1;
  void increseCount() {
    count++;
    emit(ChangeCount());
  }

  void decreseCount() {
    if (count > 0) {
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
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/services"),
        body: {
          "lang": CacheHelper.getLang(),
          "title": title,
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          searchList = data["data"];
          debugPrint(searchList.toString());

          emit(GetSearchSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(GetSearchFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(GetSearchFailure(error: error.toString()));
      }
    }
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
    homeAddress = Placemark[0].street ?? "";
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

  Future deleteNotification(
      {required String notificationId, required int index}) async {
    emit(DeleteNotificationLoading());
    try {
      http.Response response = await http
          .post(Uri.parse("${baseUrl}api/delete-notification"), body: {
        "lang": CacheHelper.getLang(),
        "notification_id": notificationId,
      }).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());

        if (data["key"] == 1) {
          showNotification.removeAt(index);
          emit(DeleteNotificationSuccess());
        } else {
          emit(DeleteNotificationFailure());
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        // Handle timeout-specific logic here
        debugPrint("Request timed out");
        emit(Timeoutt());
      }
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

  Future getProducts({required String sectionId}) async {
    emit(GetProductsLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/services"),
        body: {
          "lang": CacheHelper.getLang(),
          "section_id": sectionId,
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          products = data["data"];
          debugPrint(products.toString());

          emit(GetProductsSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(GetProductsFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(GetProductsFailure(error: error.toString()));
      }
    }
  }

  int addToCartIndex = 0;
  void changeAddToCartIndex({required int index}) {
    addToCartIndex = index;
    emit(ChangeAddToCartIndex());
  }

  Future addToCart(
      {required String serviceId,
      required String notes,
      bool isAddButton = false}) async {
    emit(AddToCartLoading());
    http.Response response = await http.post(
      Uri.parse("${baseUrl}api/add-to-cart"),
      body: {
        "lang": CacheHelper.getLang(),
        "user_id": CacheHelper.getUserId(),
        "service_id": serviceId,
        "count": isAddButton ? "1" : count.toString(),
        "notes": notes
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data["key"] == 1) {
      emit(AddToCartSuccess(message: '${data["msg"]}'));
    } else {
      emit(AddToCartFailure(error: data["msg"]));
    }
  }

  int cartCount = 0;
  List cartList = [];
  Map cartDetailes = {};
  String totalPrice = "";
  Future showCart() async {
    emit(ShowCartLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/show-cart"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());

        if (data["key"] == 1) {
          cartDetailes = data;
          cartList = data["data"];
          cartCount = cartList.length;
          // totalPrice = (((cartDetailes["sub_total"] *
          //                 (cartDetailes["value_added"] / 100)) +
          //             cartDetailes["sub_total"]) +
          //         cartDetailes["delivery"])
          //     .toString();
          debugPrint(totalPrice.toString());
          emit(ShowCartSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(ShowCartFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(ShowCartFailure(error: error.toString()));
      }
    }
  }

  int CartupdateIndex = 0;
  void updateCartIndex({required int index}) {
    cartIndex = index;
    emit(ChangeIndexSuccess());
  }

  Future updateCart({required String cartId, required String count}) async {
    emit(UpdateCartLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/update-to-cart"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
          "cart_id": cartId,
          "count": count,
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());

        if (data["key"] == 1) {
          cartList = data["data"];
          emit(UpdateCartSuccess());
          showCart();
        } else {
          debugPrint(data["msg"]);
          emit(UpdateCartFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(UpdateCartFailure(error: error.toString()));
      }
    }
  }

  Future storeOrder() async {
    emit(StoreOrderLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/store-order"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
          "payment_method": paymentIndex == 0 ? "cash" : "online",
          "address": addressIndex == 0
              ? cartDetailes["addresses"][0]["address"]
              : address,
          "lat": addressIndex == 0
              ? cartDetailes["addresses"][0]["lat"].toString()
              : lat.toString(),
          "lng": addressIndex == 0
              ? cartDetailes["addresses"][0]["lng"].toString()
              : lng.toString(),
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        notificationCount = data["notification_count"] ?? 0;

        if (data["key"] == 1) {
          emit(StoreOrderSuccess(message: data["msg"]));
          showCart();
        } else {
          debugPrint(data["msg"]);
          emit(StoreOrderFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(StoreOrderFailure(error: error.toString()));
      }
    }
  }

  List ordersList = [];
  Future showOrders({required String status}) async {
    emit(ShowOrdersLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/show-all-orders"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
          "status": status,
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          ordersList = data["data"];
          debugPrint(ordersList.toString());

          emit(ShowOrdersSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(ShowOrdersFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(ShowOrdersFailure(error: error.toString()));
      }
    }
  }

  Future addFav({required String serviceId}) async {
    emit(AddFavLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/add-to-favourite"),
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
        debugPrint(data.toString());

        if (data["key"] == 1) {
          emit(AddFavSuccess());

          getProductData(serviceId: serviceId, isFav: true);
        } else {
          debugPrint(data["msg"]);
          emit(AddFavFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(AddFavFailure(error: error.toString()));
      }
    }
  }
  List favList = [];
  Future showFav() async {
    emit(ShowFavLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/show-favourites"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          favList = data["data"];
          debugPrint(favList.toString());

          emit(ShowFavSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(ShowFavFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(ShowFavFailure(error: error.toString()));
      }
    }
  }

  int removeFavIndex = 0;
  void changeRemoveFavIndex({required int index}) {
    removeFavIndex = index;
    emit(ChangeIndex());
  }

  Future removeFav({required String serviceId, required int index}) async {
    emit(RemoveFavLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/add-to-favourite"),
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
        debugPrint(data.toString());

        if (data["key"] == 1) {
          favList.removeAt(index);
          emit(RemoveFavSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(RemoveFavFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(RemoveFavFailure(error: error.toString()));
      }
    }
  }
  Map userInfo = {};
  Future showUser() async {
    emit(ShowUserLoading());
    try {
      http.Response response =
          await http.post(Uri.parse("${baseUrl}api/show-user"), body: {
        "lang": CacheHelper.getLang(),
        "user_id": CacheHelper.getUserId(),
      }).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          userInfo = data["data"] ?? {};
          debugPrint(userInfo.toString());
          emit(ShowUserSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(ShowUserFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(ShowUserFailure(error: error.toString()));
      }
    }
  }

  Future updateProfile({
    required String firstName,
    required String phone,
    required String email,
  }) async {
    emit(UpdateProfileLoading());
    try {
      http.Response response =
          await http.post(Uri.parse("${baseUrl}api/update-user"), body: {
        "lang": CacheHelper.getLang(),
        "user_id": CacheHelper.getUserId(),
        "first_name": firstName,
        "phone": phone,
        "email": email,
      }).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());

        if (data["key"] == 1) {
          emit(UpdateProfileSuccess(message: data["msg"]));
          showUser();
        } else {
          debugPrint(data["msg"]);
          emit(UpdateProfileFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(UpdateProfileFailure(error: error.toString()));
      }
    }
  }
  
  List providerOrdersList = [];
  Future showProviderOrders({required String status}) async {
    if (lat == null) {
      await getCurrentLocation();
    }
    emit(ShowProviderOrdersLoading());

    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/show-all-provider-orders"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
          "status": status,
          "lat": lat.toString(),
          "lng": lng.toString(),
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          providerOrdersList = data["data"];
          debugPrint(providerOrdersList.toString());

          emit(ShowProviderOrdersSuccess());
        } else {
          debugPrint(data["msg"]);
          emit(ShowProviderOrdersFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(ShowProviderOrdersFailure(error: error.toString()));
      }
    }
  }

  Future changeOrderStatus({
    required String status,
    required String orderId,
  }) async {
    emit(ChangeOrderStatusLoading());
    try {
      http.Response response = await http.post(
        Uri.parse("${baseUrl}api/change-order-status"),
        body: {
          "lang": CacheHelper.getLang(),
          "user_id": CacheHelper.getUserId(),
          "order_id": orderId,
          "status": status,
        },
      ).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());

        if (data["key"] == 1) {
          emit(ChangeOrderStatusSuccess(message: data["msg"]));
        } else {
          emit(ChangeOrderStatusFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        emit(ChangeOrderStatusFailure(error: error.toString()));
      }
    }
  }
}

