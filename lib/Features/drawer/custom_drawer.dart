import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/Features/categories/categories_view.dart';
import 'package:maosul2/Features/drawer/about_app/about_app_view.dart';
import 'package:maosul2/Features/drawer/call_us/call_us_view.dart';
import 'package:maosul2/Features/drawer/privacy_policy/privacy_policy_view.dart';
import 'package:maosul2/Features/drawer/technical_support/technical_support_view.dart';
import 'package:maosul2/Features/home_layout/home_layout.dart';
import 'package:maosul2/Features/provider_screens/provider_profile/provider_profile.dart';
import 'package:maosul2/Features/start/types/types_view.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cache/cache_helper.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/assets_data.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../provider_screens/provider_orders/provider_orders_view.dart';
import '../../core/util/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(),
          width: 300.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                  color: Colors.white,
                  child: Image.asset(
                    AssetsData.logo,
                    width: 300.w,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                  child: InkWell(
                    onTap: () {
                      if (AppCubit.get(context).typeIndex == 0) {
                        AppRouter.pop(context);
                        AppRouter.navigateAndFinish(
                            context, const CategoriesView());
                      } else {
                        AppRouter.pop(context);
                        AppRouter.navigateAndFinish(
                            context, const ProviderOrderView());
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 17.w, vertical: 20.h),
                        child: InkWell(
                          onTap: () {
                            AppRouter.pop(context);
                            AppRouter.navigateTo(
                                context, const ProviderProfile());
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
                AppCubit.get(context).typeIndex == 0
                    ? Container()
                    : const Opacity(
                        opacity: 0.38,
                        child: Divider(
                          color: Color(0xff0D335D),
                          endIndent: 15,
                          indent: 15,
                          thickness: 1.5,
                        ),
                      ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                  child: InkWell(
                    onTap: () {
                      AppRouter.pop(context);
                      AppRouter.navigateTo(context, const CallUsView());
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                  child: InkWell(
                    onTap: () {
                      AppCubit.get(context).aboutApp();
                      AppRouter.pop(context);
                      AppRouter.navigateTo(context, const AboutAppView());
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                  child: InkWell(
                    onTap: () {
                      AppRouter.pop(context);
                      AppRouter.navigateTo(
                          context, const TechnicalSupportView());
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                  child: InkWell(
                    onTap: () {
                      AppCubit.get(context).condition();
                      AppRouter.pop(context);
                      AppRouter.navigateTo(context, const PrivacyPolicyView());
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
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
                      ),
                    ],
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
                if (CacheHelper.getUserId() != "") ...{
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LogOutSuccess) {
                        AppCubit.get(context).userInfo.clear();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showFlashMessage(
                            message: state.message,
                            type: FlashMessageType.success,
                            context: context);
                        if (CacheHelper.getUserType() == "client") {
                          AppRouter.navigateAndFinish(
                              context, const HomeLayout());
                        } else {
                          AppRouter.navigateAndFinish(
                              context, const TypesView());
                        }
                        CacheHelper.setUserType("");
                      } else if (state is LogOutFailure) {
                        showFlashMessage(
                            message: state.error,
                            type: FlashMessageType.error,
                            context: context);
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: LocaleKeys.logout.tr(),
                            desc: LocaleKeys.confirm_logout.tr(),
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              AuthCubit.get(context).logOut();
                            },
                          ).show();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text(
                          LocaleKeys.logout.tr(),
                          style: Styles.textStyle16.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      );
                    },
                  ),
                } else ...{
                  InkWell(
                    onTap: () {
                      AppRouter.navigateTo(context, const TypesView());
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      LocaleKeys.logIn.tr(),
                      style: Styles.textStyle16.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  )
                }
              ],
            ),
          ),
        );
      },
    );
  }
}
