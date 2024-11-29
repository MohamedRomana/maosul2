import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/core/widgets/custom_text_field.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/assets_data.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/flash_message.dart';
import '../change_pass/change_password_view.dart';

final _phoneController = TextEditingController();
final _formKey = GlobalKey<FormState>();
String forgetPassPhoneCode = "966";

class ActivationCodeView extends StatelessWidget {
  const ActivationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
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
                LocaleKeys.activationCode.tr(),
                style: Styles.textStyle24.copyWith(color: Colors.black),
              ),
              SizedBox(height: 17.h),
              SizedBox(
                width: 260.w,
                child: Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.enterYourMobileNumberToSendTheActivationCode.tr(),
                  style: Styles.textStyle16.copyWith(
                    color: const Color(0xff00818A),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 29.h, bottom: 24.h),
                child: CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.mobile_number_required.tr();
                    } else {
                      return null;
                    }
                  },
                  controller: _phoneController,
                  hintText: LocaleKeys.phone.tr(),
                  keyboardType: TextInputType.number,
                  prefixIcon: FittedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 10.w),
                          child: CountryPickerDropdown(
                            initialValue: 'SA',
                            itemBuilder: _buildDropdownItem,
                            sortComparator: (Country a, Country b) =>
                                a.isoCode.compareTo(b.isoCode),
                            onValuePicked: (Country country) {
                              forgetPassPhoneCode = country.phoneCode;
                              debugPrint(forgetPassPhoneCode);
                            },
                          ),
                        ),
                        Container(
                          height: 24.h,
                          width: 1.w,
                          decoration: const BoxDecoration(color: Colors.grey),
                        ),
                        SizedBox(width: 8.w),
                        const Icon(Icons.phone),
                      ],
                    ),
                  ),
                ),
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ForgetPassSuccess) {
                    AppRouter.navigateAndPop(
                        context, const ChangePasswordView());
                    _phoneController.clear();
                    forgetPassPhoneCode = "966";
                    showFlashMessage(
                      context: context,
                      type: FlashMessageType.success,
                      message: state.message,
                    );
                  } else if (state is ForgetPassFailure) {
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
                        AuthCubit.get(context).forgetPass(
                          phone: _phoneController.text,
                          phonecode: forgetPassPhoneCode,
                        );
                      }
                    },
                    child: state is ForgetPassLoading
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDropdownItem(Country country) => SizedBox(
      width: 80.w,
      child: FittedBox(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            // SizedBox(width: 8.w),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      ),
    );
