import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/location/location.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';

class ChooseAddress extends StatelessWidget {
  const ChooseAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 19.h, bottom: 10.h, start: 6.w),
              child: Text(
                LocaleKeys.deliveryaddress.tr(),
                style: Styles.textStyle14.copyWith(
                  color: kButtonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 93.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  InkWell(
                    onTap: () {
                      AppCubit.get(context).changeAddressIndex(0);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.currentaddress.tr(),
                              style: Styles.textStyle12
                                  .copyWith(color: Colors.black),
                            ),
                            Container(
                              height: 14.h,
                              width: 14.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kButtonColor),
                              ),
                              child: Center(
                                child: Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          AppCubit.get(context).addressIndex ==
                                                  0
                                              ? kButtonColor
                                              : Colors.transparent),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      AppCubit.get(context).changeAddressIndex(1);
                      showModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        builder: (context) => const Location(),
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.newaddress.tr(),
                            style: Styles.textStyle12
                                .copyWith(color: Colors.black),
                          ),
                          Container(
                            height: 14.h,
                            width: 14.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kButtonColor),
                            ),
                            child: Center(
                              child: Container(
                                height: 10.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppCubit.get(context).addressIndex == 1
                                            ? kButtonColor
                                            : Colors.transparent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
