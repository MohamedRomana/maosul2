import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/location/location.dart';
import '../../../../../core/util/styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/auth_cubit.dart';
import '../client_register.dart';

class CustomClientRegister extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController mailController;
  final TextEditingController locationController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;
  const CustomClientRegister({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.mailController,
    required this.locationController,
    required this.passController,
    required this.confirmPassController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              controller: nameController,
              hintText: LocaleKeys.userName.tr(),
              prefixIcon: const Icon(Icons.person),
              validator: (value) {
                if (value!.isEmpty) {
                  return LocaleKeys.username_required.tr();
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return LocaleKeys.mobile_number_required.tr();
                } else {
                  return null;
                }
              },
              controller: phoneController,
              keyboardType: TextInputType.phone,
              hintText: LocaleKeys.phone.tr(),
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
                          userRegisterPhoneCode = country.phoneCode;
                          debugPrint(userRegisterPhoneCode);
                        },
                      ),
                    ),
                    Container(
                      height: 24.h,
                      width: 1.w,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5.w),
                    const Icon(Icons.phone),
                    SizedBox(width: 5.w),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: mailController,
              hintText: LocaleKeys.email.tr(),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
              suffixIcon: Padding(
                padding: EdgeInsetsDirectional.only(end: 10.w),
                child: SizedBox(
                  width: 50.w,
                  child: Center(
                    child: Text(
                      LocaleKeys.optional.tr(),
                      style: Styles.textStyle12.copyWith(
                        color: kThirdColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    builder: (context) =>
                        SizedBox(height: 700.h, child: const Location()));
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return LocaleKeys.location_required.tr();
                  } else {
                    return null;
                  }
                },
                controller: locationController,
                enabled: false,
                hintText: LocaleKeys.selectYourLocation.tr(),
                prefixIcon: const Icon(Icons.location_on),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return LocaleKeys.password_mismatch.tr();
                } else {
                  return null;
                }
              },
              controller: passController,
              hintText: LocaleKeys.password.tr(),
              obscureText: AuthCubit.get(context).registerIsSecure1 == true
                  ? false
                  : true,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: InkWell(
                onTap: () => AuthCubit.get(context).changeRegisterIsSecure1(),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  AuthCubit.get(context).registerIsSecure1 == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: kButtonColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              validator: (value) {
                if (passController.text != confirmPassController.text) {
                  return LocaleKeys.password_mismatch.tr();
                } else {
                  return null;
                }
              },
              controller: confirmPassController,
              hintText: LocaleKeys.confirmPassword.tr(),
              obscureText: AuthCubit.get(context).registerIsSecure2 == true
                  ? false
                  : true,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => AuthCubit.get(context).changeRegisterIsSecure2(),
                child: Icon(
                  AuthCubit.get(context).registerIsSecure2 == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: kButtonColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildDropdownItem(Country country) => SizedBox(
      width: 70.w,
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
