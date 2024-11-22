import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/provider_screens/provider_profile/provider_profile_edit/provider_profile_edit.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/app_router.dart';

class ProviderNameProfile extends StatelessWidget {
  const ProviderNameProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            AppRouter.navigateTo(
                context,
                ProviderProfileEdit(
                  userInfo: AppCubit.get(context).userInfo,
                ));
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            height: 104.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: kFourthColor,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.r,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppCubit.get(context).userInfo["first_name"] ?? "",
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(50.w, 50.h),
                      shape: const CircleBorder(),
                      backgroundColor: const Color(0xffB5C4B5),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
