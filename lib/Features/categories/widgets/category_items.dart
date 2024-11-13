import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/util/app_router.dart';
import '../../../core/util/styles.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppCubit.get(context).changeScreenIndex(index: 0);
        GoRouter.of(context).pushReplacement(AppRouters.kHomeLayout);
      },
      child: Container(
        height: 80.h,
        width: 110.w,
        margin: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: const Color(0xffF0F9F4),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/flour.png',
              height: 40.h,
            ),
            Text(
              'مواد غذائية جملة',
              style:
                  Styles.textStyle12.copyWith(color: const Color(0xff293462)),
            )
          ],
        ),
      ),
    );
  }
}
