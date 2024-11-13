import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/views/provider_register/widgets/image_row.dart';

class ProviderProfileEdit extends StatelessWidget {
  const ProviderProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: 'تعديل البيانات',
          widget2: Container(),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(
            fillColor: kFourthColor,
            focusedColor: kButtonColor,
            enabledColor: kButtonColor,
            horizontal: 20,
            vertical: 8,
            hintText: 'احمد محمد احمد',
            hintStyle: Styles.textStyle14.copyWith(color: Colors.black),
            prefixIcon: const Icon(Icons.person),
          ),
          CustomTextField(
            fillColor: kFourthColor,
            focusedColor: kButtonColor,
            enabledColor: kButtonColor,
            keyboardType: TextInputType.emailAddress,
            horizontal: 20,
            vertical: 8,
            hintText: 'benimaskim1994@gmail.com',
            hintStyle: Styles.textStyle14.copyWith(color: Colors.black),
            prefixIcon: const Icon(Icons.mail),
          ),
          CustomTextField(
            fillColor: kFourthColor,
            focusedColor: kButtonColor,
            enabledColor: kButtonColor,
            keyboardType: TextInputType.phone,
            horizontal: 20,
            vertical: 8,
            hintText: '+9662584258258',
            hintStyle: Styles.textStyle14.copyWith(color: Colors.black),
            prefixIcon: const Icon(Icons.phone_in_talk),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: const ImageRow(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              boxShadow: [
                BoxShadow(
                  color: kButtonColor.withOpacity(0.5),
                  blurRadius: 10.r,
                  offset: const Offset(7, 7),
                ),
              ],
            ),
            child: CustomElevatedButton(
              onPressed: () {},
              text: LocaleKeys.save.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
