import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/util/assets_data.dart';
import '../../../../core/util/styles.dart';

class ActivationPinCodeView extends StatelessWidget {
  const ActivationPinCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    String otpCode = "";
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Center(
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
                LocaleKeys.activationCode.tr(),
                style: Styles.textStyle24.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 17.h,
              ),
              Text(
                LocaleKeys.enterTheActivationCodeSentToYourMobileNumber.tr(),
                style: Styles.textStyle16.copyWith(
                  color: const Color(0xff00818A),
                ),
              ),
              SizedBox(
                height: 29.h,
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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is OTPSuccess) {
                    AppRouter.pop(context);
                    AppRouter.pop(context);
                    showFlashMessage(
                      message: 'Success',
                      type: FlashMessageType.success,
                      context: context,
                    );
                  } else if (state is OTPFailure) {
                    showFlashMessage(
                      message: state.error,
                      type: FlashMessageType.error,
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    onPressed: () async {
                      await AuthCubit.get(context).otp(code: otpCode);
                    },
                    child: state is OTPLoading
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
    );
  }
}
