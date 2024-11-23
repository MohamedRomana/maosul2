import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool registerIsSecure1 = false;
  void changeRegisterIsSecure1() {
    registerIsSecure1 = !registerIsSecure1;
    emit(ChangeSecureIcon());
  }

  bool registerIsSecure2 = false;
  void changeRegisterIsSecure2() {
    registerIsSecure2 = !registerIsSecure2;
    emit(ChangeSecureIcon());
  }

  bool providerRegisterIsSecure1 = false;
  void changeProviderRegisterIsSecure1() {
    providerRegisterIsSecure1 = !providerRegisterIsSecure1;
    emit(ChangeSecureIcon());
  }

  bool providerRegisterIsSecure2 = false;
  void changeProviderRegisterIsSecure2() {
    providerRegisterIsSecure2 = !providerRegisterIsSecure2;
    emit(ChangeSecureIcon());
  }

  bool loginIsSecure = false;
  void changeLoginIsSecure() {
    loginIsSecure = !loginIsSecure;
    emit(ChangeSecureIcon());
  }

  bool providerLoginIsSecure = false;
  void changeProviderLoginIsSecure() {
    providerLoginIsSecure = !providerLoginIsSecure;
    emit(ChangeSecureIcon());
  }

  bool changePasswordIsSecure1 = false;
  void changePasswordIsSecure() {
    changePasswordIsSecure1 = !changePasswordIsSecure1;
    emit(ChangePassowrdSecureIcon());
  }

  bool confirmPasswordIsSecure1 = false;
  void confirmPasswordIsSecure() {
    confirmPasswordIsSecure1 = !confirmPasswordIsSecure1;
    emit(ConfirmPassowrdSecureIcon());
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

  bool agreeTerms = false;
  void changeAgreeTerms() {
    agreeTerms = !agreeTerms;
    emit(ChangeAgreeTerms());
  }

  String? identityImageUrl;
  Future uploadIdentityImage({required List<File> identityImage}) async {
    emit(UploadImageLoading());
    final request =
        http.MultipartRequest('POST', Uri.parse("${baseUrl}api/upload-image"));
    request.fields['lang'] = CacheHelper.getLang();

    for (var image in identityImage) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    Map<String, dynamic> data = jsonDecode(responseBody);
    identityImageUrl = data["app_url"];
    debugPrint("imageUrl is $identityImageUrl");

    if (data["key"] == 1) {
      emit(UploadImageSuccess());
    } else {
      emit(UploadImageFailure());
    }
  }

  String? licenseImageUrl;
  Future uploadLicenseImage({required List<File> licenseImage}) async {
    emit(UploadImageLoading());
    final request =
        http.MultipartRequest('POST', Uri.parse("${baseUrl}api/upload-image"));
    request.fields['lang'] = CacheHelper.getLang();

    for (var image in licenseImage) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    Map<String, dynamic> data = jsonDecode(responseBody);
    licenseImageUrl = data["app_url"];
    debugPrint("imageUrl is $licenseImageUrl");

    if (data["key"] == 1) {
      emit(UploadImageSuccess());
    } else {
      emit(UploadImageFailure());
    }
  }

  String? carImageUrl;
  Future uploadCarImage({required List<File> carImage}) async {
    emit(UploadImageLoading());
    final request =
        http.MultipartRequest('POST', Uri.parse("${baseUrl}api/upload-image"));
    request.fields['lang'] = CacheHelper.getLang();

    for (var image in carImage) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    Map<String, dynamic> data = jsonDecode(responseBody);
    carImageUrl = data["app_url"];
    debugPrint("imageUrl is $carImageUrl");

    if (data["key"] == 1) {
      emit(UploadImageSuccess());
    } else {
      emit(UploadImageFailure());
    }
  }

  Future register({
    required String userType,
    required String firstName,
    required String phoneCode,
    required String phone,
    required String mail,
    required String password,
    required String address,
    required String lat,
    required String lng,
  }) async {
    emit(RegisterLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/register"), body: {
      "lang": CacheHelper.getLang(),
      "user_type": userType,
      "first_name": firstName,
      "email": mail,
      "phone_code": phoneCode,
      "phone": phone,
      "password": password,
      "address": address,
      "lat": lat,
      "lng": lng,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      await CacheHelper.setUserId(data["data"]["id"].toString());
      emit(RegisterSuccess(message: data["msg"]));
    } else {
      debugPrint(data["msg"]);
      emit(RegisterFailure(error: data["msg"]));
    }
  }

  Future otp({required String code}) async {
    emit(OTPLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/active-account"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
      "code": code,
      "device_id": CacheHelper.getDeviceToken(),
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      emit(OTPSuccess());
    } else {
      emit(OTPFailure(error: data["msg"]));
    }
  }

  Future login({
    required String userType,
    required String phoneCode,
    required String phone,
    required String password,
  }) async {
    emit(LogInLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/login"), body: {
      "lang": CacheHelper.getLang(),
      "user_type": userType,
      "phone_code": phoneCode,
      "phone": phone,
      "password": password,
      "device_id": CacheHelper.getDeviceToken(),
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());
    if (data["key"] == 1) {
      await CacheHelper.setUserToken(data["data"]["api_token"]);
      await CacheHelper.setUserType(data["data"]["user_type"]);
      await CacheHelper.setUserId(data["data"]["id"].toString());
      emit(LogInSuccess());
    } else {
      emit(LogInFailure(error: data["msg"]));
    }
  }

  String resetPassId = "";
  Future forgetPass({
    required String phone,
    required String phonecode,
  }) async {
    emit(ForgetPassLoading());
    try {
      http.Response response =
          await http.post(Uri.parse('${baseUrl}api/forget-password'), body: {
        "lang": CacheHelper.getLang(),
        "phone": phone,
        "phone_code": phonecode,
      });
      Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint(data.toString());

      if (data["key"] == 1) {
        resetPassId = data["data"]["id"].toString();
        debugPrint(resetPassId);
        emit(ForgetPassSuccess(message: data['msg']));
      } else {
        debugPrint(data["msg"]);
        emit(ForgetPassFailure(error: data["msg"]));
      }
    } catch (e) {
      emit(ForgetPassFailure(error: e.toString()));
    }
  }

  Future resetPass({
    required String code,
    required String password,
  }) async {
    emit(ResetPassLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/reset-password"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": resetPassId,
      "code": code,
      "password": password,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      emit(ResetPassSuccess(message: data["msg"]));
    } else {
      emit(ResetPassFailure(error: data["msg"]));
    }
  }

  Future providerRegister(
      {required String firstName,
      required String email,
      required String phoneCode,
      required String phone,
      required String password,
      required String carType}) async {
    emit(ProviderRegisterLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/register"), body: {
      "lang": CacheHelper.getLang(),
      "user_type": "provider",
      "first_name": firstName,
      "email": email,
      "phone_code": phoneCode,
      "phone": phone,
      "password": password,
      "car_type": carType,
      "id_image": identityImageUrl,
      "license_image": licenseImageUrl,
      "ecommercy_image": carImageUrl,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      await CacheHelper.setUserId(data["data"]["id"].toString());
      emit(ProviderRegisterSuccess(message: data["msg"]));
    } else {
      debugPrint(data["msg"]);
      emit(ProviderRegisterFailure(error: data["msg"]));
    }
  }
  Future logOut() async {
    emit(LogOutLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/logout"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
      "device_id": CacheHelper.getDeviceToken(),
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      CacheHelper.setUserId("");
      CacheHelper.setUserToken("");
      emit(LogOutSuccess(message: data["msg"]));
    } else {
      emit(LogOutFailure(error: data["msg"]));
    }
  }
}
