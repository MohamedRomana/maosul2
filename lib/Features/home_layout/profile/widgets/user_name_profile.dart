import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';
import '../../../profile_edit/profile_edit_view.dart';

class UserNameProfile extends StatelessWidget {
  const UserNameProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            AppRouter.navigateTo(context, const ProfileEditView());
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
              padding: EdgeInsetsDirectional.only(start: 24.w, end: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppCubit.get(context).userInfo["first_name"] ?? '',
                        style: Styles.textStyle16.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(AppCubit.get(context).userInfo["address"] ?? "",
                          style:
                              Styles.textStyle10.copyWith(color: kButtonColor)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(50.w, 50.h),
                        shape: const CircleBorder(),
                        backgroundColor: const Color(0xffB5C4B5)),
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
