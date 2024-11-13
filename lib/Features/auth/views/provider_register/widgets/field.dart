import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/Features/auth/views/provider_register/provider_register_view.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/util/styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/locale_keys.g.dart';

class Fields extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController mailController;
  final TextEditingController carController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;

  const Fields({
    super.key,
    required this.carController,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.mailController,
    required this.passController,
    required this.confirmPassController,
  });

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    List<String> cars = ['small', 'big'];
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: widget.nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "اسم المستخدم مطلوب";
              } else {
                return null;
              }
            },
            hintText: LocaleKeys.userName.tr(),
            prefixIcon: const Icon(Icons.person),
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: widget.phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return "رقم الجوال مطلوب";
              } else {
                return null;
              }
            },
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
                        providerRegisterPhoneCode = country.phoneCode;
                        debugPrint(country.phoneCode);
                        debugPrint(providerRegisterPhoneCode);
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
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            controller: widget.mailController,
            hintText: LocaleKeys.email.tr(),
            prefixIcon: const Icon(Icons.mail),
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
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            controller: widget.carController,
            validator: (value) {
              if (value!.isEmpty) {
                return "نوع السياره مطلوب";
              } else {
                return null;
              }
            },
            hintText: 'نوع السياره',
            prefixIcon: const Icon(Icons.car_rental),
            suffixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 10.w),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: cars.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      widget.carController.text = value!;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            controller: widget.passController,
            validator: (value) {
              if (value!.isEmpty) {
                return "كلمة المرور مطلوبة";
              } else {
                return null;
              }
            },
            obscureText:
                AuthCubit.get(context).providerRegisterIsSecure1 == true ? false : true,
            hintText: LocaleKeys.password.tr(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: InkWell(
              onTap: () {
                AuthCubit.get(context).changeProviderRegisterIsSecure1();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                AuthCubit.get(context).providerRegisterIsSecure1 == true
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: kButtonColor,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            controller: widget.confirmPassController,
            validator: (value) {
              if (widget.passController.text !=
                  widget.confirmPassController.text) {
                return "كلمة المرور غير متطابقة";
              } else {
                return null;
              }
            },
            obscureText:
                AuthCubit.get(context).providerRegisterIsSecure2 == true ? false : true,
            hintText: LocaleKeys.confirmPassword.tr(),
            prefixIcon: const Icon(
              Icons.lock,
            ),
            suffixIcon: InkWell(
              onTap: () {
                AuthCubit.get(context).changeProviderRegisterIsSecure2();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                AuthCubit.get(context).providerRegisterIsSecure2 == true
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: kButtonColor,
              ),
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
        ],
      ),
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
