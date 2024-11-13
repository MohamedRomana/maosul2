import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/util/styles.dart';
import '../../../../generated/locale_keys.g.dart';

class UserNameProfile extends StatelessWidget {
  const UserNameProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kProfileEditView);
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
                    LocaleKeys.userName.tr(),
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text('حي الصحافة - ش الملك سعود',
                      style: Styles.textStyle10.copyWith(color: kButtonColor)),
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
  }
}
