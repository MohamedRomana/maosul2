import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/core/widgets/custom_text_field.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/util/assets_data.dart';
import '../../../../core/util/styles.dart';

final _formKey = GlobalKey<FormState>();
final _passController = TextEditingController();
final _confirmPassController = TextEditingController();

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    String otpCode = "";
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.h, bottom: 68.h),
                      child: Image.asset(
                        AssetsData.logo,
                        height: 87.41.h,
                      ),
                    ),
                    Text(
                      LocaleKeys.changePassword.tr(),
                      style: Styles.textStyle24.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: PinCodeTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        appContext: context,
                        length: 4,
                        textStyle: Styles.textStyle24.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: const Color(0xff86AD99),
                          selectedFillColor: kSecondaryColor,
                          disabledColor: Colors.white,
                          activeColor: Colors.transparent,
                          inactiveColor: Colors.transparent,
                          inactiveFillColor: Colors.white,
                          selectedColor: Colors.transparent,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        onCompleted: (code) {
                          otpCode = code;
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomTextField(
                      controller: _passController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'كلمة المرور مطلوبه';
                        } else {
                          return null;
                        }
                      },
                      obscureText:
                          AuthCubit.get(context).changePasswordIsSecure1 == true
                              ? false
                              : true,
                      hintText: LocaleKeys.password.tr(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () =>
                            AuthCubit.get(context).changePasswordIsSecure(),
                        child: Icon(
                          AuthCubit.get(context).changePasswordIsSecure1 == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kButtonColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: _confirmPassController,
                      validator: (value) {
                        if (_passController.text !=
                            _confirmPassController.text) {
                          return 'كلمة المرور غير متطابقة';
                        } else {
                          return null;
                        }
                      },
                      obscureText:
                          AuthCubit.get(context).confirmPasswordIsSecure1 ==
                                  true
                              ? false
                              : true,
                      hintText: LocaleKeys.confirmPassword.tr(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () =>
                            AuthCubit.get(context).confirmPasswordIsSecure(),
                        child: Icon(
                          AuthCubit.get(context).confirmPasswordIsSecure1 ==
                                  true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kButtonColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is ResetPassFailure) {
                          showFlashMessage(
                            message: state.error,
                            type: FlashMessageType.error,
                            context: context,
                          );
                        } else if (state is ResetPassSuccess) {
                          Navigator.pop(context);
                          _passController.clear();
                          _confirmPassController.clear();
                          otpCode = "";
                          AuthCubit.get(context).resetPassId = "";
                          showFlashMessage(
                            message: state.message,
                            type: FlashMessageType.success,
                            context: context,
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AuthCubit.get(context).resetPass(
                                  code: otpCode,
                                  password: _passController.text);
                            }
                          },
                          child: state is ResetPassLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  LocaleKeys.done.tr(),
                                  style: Styles.textStyle16,
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
