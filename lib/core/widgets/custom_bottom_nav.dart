// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../constants.dart';
import '../util/app_router.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10.r,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  AppCubit.get(context).changeScreenIndex(index: 0);
                  GoRouter.of(context).pushReplacement(AppRouters.kHomeLayout);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/Group 2627.svg',
                      height: 15.h,
                      color: Colors.grey,
                    ),
                    Text(
                      LocaleKeys.stores.tr(),
                      style: Styles.textStyle12.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  AppCubit.get(context).changeScreenIndex(index: 1);
                  GoRouter.of(context)
                      .pushReplacement(AppRouters.kHomeLayout);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/shopping-cart.svg',
                      height: 15.h,
                      color: Colors.grey,
                    ),
                    Text(
                      LocaleKeys.cart.tr(),
                      style: Styles.textStyle12.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  AppCubit.get(context).changeScreenIndex(index: 2);
                  GoRouter.of(context).pushReplacement(AppRouters.kHomeLayout);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/home.svg',
                      height: 25.h,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  AppCubit.get(context).changeScreenIndex(index: 3);
                  GoRouter.of(context).pushReplacement(AppRouters.kHomeLayout);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/delivery-box.svg',
                      height: 15.h,
                      color: Colors.grey,
                    ),
                    Text(
                      LocaleKeys.orders.tr(),
                      style: Styles.textStyle12.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  AppCubit.get(context).changeScreenIndex(index: 4);
                  GoRouter.of(context).pushReplacement(AppRouters.kHomeLayout);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/user.svg',
                      height: 15.h,
                      color: Colors.grey,
                    ),
                    Text(
                      LocaleKeys.myaccount.tr(),
                      style: Styles.textStyle12.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}