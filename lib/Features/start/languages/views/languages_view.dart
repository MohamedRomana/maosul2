import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/util/assets_data.dart';
import 'widgets/language_buttons.dart';

class LanguagesView extends StatelessWidget {
  const LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 100, bottom: 65, left: 58, right: 58),
              child: Image.asset(
                AssetsData.logo,
                height: 87.41.h,
              ),
            ),
            Text(
              'اختر اللغة المناسبة',
              style: Styles.textStyle24,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 24, left: 32, right: 32),
              child: LanguageButtons(),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (AppCubit.get(context).langIndex == 0) {
                  CacheHelper.setLang('ar');
                  context.setLocale(const Locale('ar'));
                } else {
                  CacheHelper.setLang('en');
                  context.setLocale(const Locale('en'));
                }

                GoRouter.of(context).pushReplacement(AppRouters.kTypesView);
              },
              text: 'تأكيد',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
