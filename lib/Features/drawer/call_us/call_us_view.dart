import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/core/widgets/custom_text_field.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../core/widgets/custom_drawer.dart';

class CallUsView extends StatelessWidget {
  const CallUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      bottomNavigationBar:
          AppCubit.get(context).typeIndex == 0 ? const CustomBottomNav() : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.callus.tr(),
          widget2: Container(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الاسم',
                    style: Styles.textStyle16.copyWith(color: kButtonColor),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomTextField(
                    hintText: 'الاسم بالكامل',
                    focusedColor: kButtonColor,
                    enabledColor: Colors.grey,
                    horizontal: 1,
                    vertical: 8,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'البريد الالكترونى',
                    style: Styles.textStyle16.copyWith(color: kButtonColor),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomTextField(
                    hintText: 'ادخل حساب البريد الخاص بك',
                    focusedColor: kButtonColor,
                    enabledColor: Colors.grey,
                    horizontal: 1,
                    vertical: 8,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نص  الرسالة',
                    style: Styles.textStyle16.copyWith(color: kButtonColor),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                    hintText: 'رسالتك',
                    focusedColor: kButtonColor,
                    enabledColor: Colors.grey,
                    maxLines: 5,
                    horizontal: 1,
                    vertical: 10,
                    borderRadius: BorderRadius.circular(10.r),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomElevatedButton(
                onPressed: () {},
                text: 'ارسال',
              )
            ],
          ),
        ),
      ),
    );
  }
}
