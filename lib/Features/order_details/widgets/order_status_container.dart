// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';

import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class OrderStatusContainer extends StatelessWidget {
  const OrderStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Center(
          child: Container(
            height: 144.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: kFourthColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حالة الطلب',
                    style: Styles.textStyle18.copyWith(
                      color: kButtonColor,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            AppCubit.get(context)
                                .changeOrderStatusIndex(index: 0);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: 71.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color:
                                    AppCubit.get(context).orderStatusIndex == 0
                                        ? Colors.white
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/ic_settings_backup_restore_24px.svg',
                                  color:
                                      AppCubit.get(context).orderStatusIndex ==
                                              0
                                          ? kButtonColor
                                          : kThirdColor,
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  'تم ارسال الطلب',
                                  style: Styles.textStyle12.copyWith(
                                      color: AppCubit.get(context)
                                                  .orderStatusIndex ==
                                              0
                                          ? kButtonColor
                                          : kThirdColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AppCubit.get(context)
                                .changeOrderStatusIndex(index: 1);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: 71.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color:
                                    AppCubit.get(context).orderStatusIndex == 1
                                        ? Colors.white
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.schedule,
                                  color:
                                      AppCubit.get(context).orderStatusIndex ==
                                              1
                                          ? kButtonColor
                                          : kThirdColor,
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  'جاري التوصيل',
                                  style: Styles.textStyle12.copyWith(
                                      color: AppCubit.get(context)
                                                  .orderStatusIndex ==
                                              1
                                          ? kButtonColor
                                          : kThirdColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AppCubit.get(context)
                                .changeOrderStatusIndex(index: 2);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: 71.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color:
                                    AppCubit.get(context).orderStatusIndex == 2
                                        ? Colors.white
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.done,
                                  color:
                                      AppCubit.get(context).orderStatusIndex ==
                                              2
                                          ? kButtonColor
                                          : kThirdColor,
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  'تم التوصيل',
                                  style: Styles.textStyle12.copyWith(
                                      color: AppCubit.get(context)
                                                  .orderStatusIndex ==
                                              2
                                          ? kButtonColor
                                          : kThirdColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
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
