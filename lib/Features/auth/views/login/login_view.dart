import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/Features/auth/views/client_register/client_register.dart';
import 'package:maosul2/Features/auth/views/forget_pass/activation_code_view.dart';
import 'package:maosul2/Features/auth/views/provider_register/provider_register_view.dart';
import 'package:maosul2/Features/home_layout/home_layout.dart';
import 'package:maosul2/Features/provider_screens/provider_orders/provider_orders_view.dart';
import 'package:maosul2/core/cache/cache_helper.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/util/assets_data.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'widgets/login_fields.dart';

final _formKey = GlobalKey<FormState>();
final _phoneController = TextEditingController();
final _passController = TextEditingController();
String phoneCode = "";

class LoginView extends StatefulWidget {
  final String type;
  const LoginView({super.key, required this.type});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    _phoneController.clear();
    _passController.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.h, bottom: 65.h),
                    child: Image.asset(
                      AssetsData.logo,
                      height: 87.41.h,
                    ),
                  ),
                  Text(
                    LocaleKeys.logIn.tr(),
                    style: Styles.textStyle24.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 40.h),
                  LoginFields(
                    phoneController: _phoneController,
                    passController: _passController,
                    formKey: _formKey,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LogInSuccess) {
                        AppCubit.get(context).changeScreenIndex(index: 2);
                        AppRouter.pop(context);
                        AppRouter.navigateAndPop(
                            context,
                            CacheHelper.getUserType() == "client"
                                ? const HomeLayout()
                                : const ProviderOrderView());

                        _phoneController.clear();
                        _passController.clear();
                        showFlashMessage(
                          message: LocaleKeys.welcome_message.tr(),
                          type: FlashMessageType.success,
                          context: context,
                        );
                      } else if (state is LogInFailure) {
                        showFlashMessage(
                          context: context,
                          type: FlashMessageType.error,
                          message: state.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await AuthCubit.get(context).login(
                              userType: widget.type,
                              phoneCode: phoneCode,
                              phone: _phoneController.text,
                              password: _passController.text,
                            );
                          }
                        },
                        child: state is LogInLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                LocaleKeys.logIn.tr(),
                                style: Styles.textStyle16,
                              ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  GestureDetector(
                    child: GestureDetector(
                      onTap: () {
                        AppRouter.navigateTo(
                            context, const ActivationCodeView());
                      },
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        style: Styles.textStyle14.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (AppCubit.get(context).typeIndex == 0) {
                        AppRouter.navigateTo(context, const ClientRegister());
                      } else {
                        AppRouter.navigateTo(
                            context, const ProviderRegisterView());
                      }
                    },
                    child: Text(LocaleKeys.newUser.tr(),
                        style: Styles.textStyle18, textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 206.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
