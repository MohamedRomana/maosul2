import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maosul2/Features/notifications/notification_view.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../core/constants.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/util/styles.dart';
import '../../../generated/locale_keys.g.dart';

class StoresNameAppBar extends StatelessWidget {
  const StoresNameAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              InkWell(
                onTap: () => scaffoldKey.currentState!.openDrawer(),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 20.w, start: 8.w),
                  child: SvgPicture.asset(
                    "assets/svg/Shape 547.svg",
                    height: 15.h,
                    width: 19.w,
                  ),
                ),
              ),
              Text(
                LocaleKeys.storename.tr(),
                style: Styles.textStyle18.copyWith(color: Colors.black),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  AppCubit.get(context).showNotificationData();
                  AppRouter.navigateTo(context, const NotificationView());
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
        ],
      ),
    );
  }
}
