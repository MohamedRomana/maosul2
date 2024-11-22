import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/views/login/login_view.dart';
import 'package:maosul2/Features/start/types/widgets/types_button.dart';
import 'package:maosul2/core/util/assets_data.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/cubit/app_cubit.dart';

class TypesViewBody extends StatelessWidget {
  const TypesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            LocaleKeys.userType.tr(),
            style: Styles.textStyle24,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 24, left: 32, right: 32),
            child: TypesButton(),
          ),
          CustomElevatedButton(
              onPressed: () {
                AppRouter.navigateTo(
                  context,
                  LoginView(
                    type: AppCubit.get(context).typeIndex == 0
                        ? "client"
                        : "provider",
                  ),
                );
              },
              text: LocaleKeys.done.tr()),
          const Spacer(),
        ],
      ),
    );
  }
}
