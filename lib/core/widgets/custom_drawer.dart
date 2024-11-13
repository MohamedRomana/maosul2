import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cache/cache_helper.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/assets_data.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../util/app_router.dart';
import '../util/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      shape: const RoundedRectangleBorder(),
      width: 300.w,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
              color: Colors.white,
              child: Image.asset(
                AssetsData.logo,
                width: 300.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
              child: InkWell(
                onTap: () {
                  if (AppCubit.get(context).typeIndex == 0) {
                    GoRouter.of(context).push(AppRouters.kCategoriesView);
                  } else {
                    GoRouter.of(context).push(AppRouters.kprovidreOrderView);
                  }
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_dashboard_24px.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(
                      width: 11.h,
                    ),
                    Text(
                      AppCubit.get(context).typeIndex == 0
                          ? LocaleKeys.categories.tr()
                          : LocaleKeys.orders.tr(),
                      style: Styles.textStyle16.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const Opacity(
              opacity: 0.38,
              child: Divider(
                color: Color(0xff0D335D),
                endIndent: 15,
                indent: 15,
                thickness: 1.5,
              ),
            ),
            AppCubit.get(context).typeIndex == 0
                ? Container()
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouters.kProviderProfileView);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: kButtonColor,
                            size: 25.sp,
                          ),
                          SizedBox(
                            width: 11.h,
                          ),
                          Text(
                            LocaleKeys.myaccount.tr(),
                            style: Styles.textStyle16.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
          AppCubit.get(context).typeIndex == 0 ? Container() :  const Opacity(
              opacity: 0.38,
              child: Divider(
                color: Color(0xff0D335D),
                endIndent: 15,
                indent: 15,
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kCallUsView);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_markunread_24px.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(
                      width: 11.h,
                    ),
                    Text(
                      LocaleKeys.callus.tr(),
                      style: Styles.textStyle16.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const Opacity(
              opacity: 0.38,
              child: Divider(
                color: Color(0xff0D335D),
                endIndent: 15,
                indent: 15,
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kAboutAppView);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_info_24px.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(
                      width: 11.h,
                    ),
                    Text(
                      LocaleKeys.aboutapp.tr(),
                      style: Styles.textStyle16.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const Opacity(
              opacity: 0.38,
              child: Divider(
                color: Color(0xff0D335D),
                endIndent: 15,
                indent: 15,
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kTechnicalSupportView);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_message_24px.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(
                      width: 11.h,
                    ),
                    Text(
                      LocaleKeys.technicalsupport.tr(),
                      style: Styles.textStyle16.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const Opacity(
              opacity: 0.38,
              child: Divider(
                color: Color(0xff0D335D),
                endIndent: 15,
                indent: 15,
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kPrivacyPolicyView);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_description_24px.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(
                      width: 11.h,
                    ),
                    Text(
                      LocaleKeys.privacypolicy.tr(),
                      style: Styles.textStyle16.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const Opacity(
              opacity: 0.38,
              child: Divider(
                color: Color(0xff0D335D),
                endIndent: 15,
                indent: 15,
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_language_24px.svg',
                    width: 18.w,
                    height: 18.h,
                  ),
                  SizedBox(
                    width: 11.h,
                  ),
                  Text(
                    LocaleKeys.english.tr(),
                    style: Styles.textStyle16.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Transform.scale(
                    scale: 0.8.r,
                    child: Switch(
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      activeColor: kButtonColor,
                      inactiveThumbColor: kButtonColor,
                      inactiveTrackColor: Colors.white,
                      value: CacheHelper.getLang() == "en" ? true : false,
                      onChanged: (value) {
                        if (CacheHelper.getLang() == "ar") {
                          Navigator.pop(context);
                          CacheHelper.setLang('en');
                          context.setLocale(const Locale('en'));
                        } else {
                          Navigator.pop(context);
                          CacheHelper.setLang('ar');
                          context.setLocale(const Locale('ar'));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}