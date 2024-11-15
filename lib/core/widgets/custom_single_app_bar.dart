import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../generated/locale_keys.g.dart';
import '../constants.dart';
import '../cubit/app_cubit.dart';
import '../util/app_router.dart';
import '../util/styles.dart';

class CustomSingleAppBar extends StatelessWidget {
  const CustomSingleAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          title: Row(
            children: [
              InkWell(
                onTap: () => scaffoldKey.currentState!.openDrawer(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SvgPicture.asset(
                    "assets/svg/Shape 547.svg",
                    height: 15.h,
                    width: 19.w,
                  ),
                ),
              ),
              Text(LocaleKeys.storename.tr(),
                  style: Styles.textStyle18.copyWith(color: Colors.black)),
              const Spacer(),
              InkWell(
                onTap: () {
                  AppCubit.get(context).showNotificationData();
                  GoRouter.of(context).push(AppRouters.kNotificationView);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 29.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                  size: 25.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
