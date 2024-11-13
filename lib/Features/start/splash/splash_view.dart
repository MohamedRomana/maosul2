// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/util/app_router.dart';
import '../../../core/util/assets_data.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        CacheHelper.getLang() != "" ?
            // CacheHelper.getUserId() != ""?
            // GoRouter.of(context).pushReplacement(AppRouters.kHomeLayout)
          //  : 
           GoRouter.of(context).pushReplacement(AppRouters.kTypesView)
            : GoRouter.of(context).pushReplacement(AppRouters.kOnBoardingView);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.translate(
            offset: Offset(0, value * MediaQuery.of(context).size.height / 2),
            child: child,
          );
        },
        child: Center(
          child: Image.asset(
            AssetsData.logo,
            height: 87.41.h,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
