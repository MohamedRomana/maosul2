import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Features/start/types/types_view.dart';
import '../../generated/locale_keys.g.dart';
import '../constants.dart';
import '../util/styles.dart';
import 'app_router.dart';

class LoginFirst extends StatelessWidget {
  const LoginFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
           LocaleKeys.login_first.tr(),
            style: Styles.textStyle18.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              AppRouter.navigateAndPop(context, const TypesView());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kButtonColor,
              minimumSize: Size(200.w, 48.h),
            ),
            child: Text(
              LocaleKeys.logIn.tr(),
              style: Styles.textStyle16,
            ),
          )
        ],
      ),
    );
  }
}
