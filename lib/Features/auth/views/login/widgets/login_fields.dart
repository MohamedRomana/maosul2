import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/views/login/login_view.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/auth_cubit.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;

  const LoginFields({
    super.key,
    required this.phoneController,
    required this.passController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'الرقم مطلوب';
              } else {
                return null;
              }
            },
            hintText: LocaleKeys.phone.tr(),
            keyboardType: TextInputType.number,
            prefixIcon: SizedBox(
              width: 130.w,
              child: FittedBox(
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
                          phoneCode = country.phoneCode;
                          debugPrint(country.name);
                          debugPrint(country.phoneCode);
                        },
                      ),
                    ),
                    Container(
                      height: 24.h,
                      width: 1.w,
                      decoration: const BoxDecoration(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Icon(Icons.phone),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: passController,
            validator: (value) {
              if (value!.isEmpty) {
                return "كلمة المرور مطلوبه";
              } else {
                return null;
              }
            },
            obscureText: AppCubit.get(context).typeIndex == 0
                ? AuthCubit.get(context).loginIsSecure == true
                    ? false
                    : true
                : AuthCubit.get(context).providerLoginIsSecure == true
                    ? false
                    : true,
            hintText: LocaleKeys.password.tr(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (AppCubit.get(context).typeIndex == 0) {
                  AuthCubit.get(context).changeLoginIsSecure();
                } else {
                  AuthCubit.get(context).changeProviderLoginIsSecure();
                }
              },
              child: Icon(
                AppCubit.get(context).typeIndex == 0
                    ? AuthCubit.get(context).loginIsSecure == true
                        ? Icons.visibility
                        : Icons.visibility_off
                    : AuthCubit.get(context).providerLoginIsSecure == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                color: kButtonColor,
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
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
