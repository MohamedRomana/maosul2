import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/generated/locale_keys.g.dart';

class TypesButton extends StatelessWidget {
  const TypesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          height: 48.h,
          width: 311.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  AppCubit.get(context).changeTypeIndex(index: 0);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 48.h,
                  width: 155.w,
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).typeIndex == 0
                        ? kButtonColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.client.tr(),
                      style: Styles.textStyle16.copyWith(
                        color: AppCubit.get(context).typeIndex == 0
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  AppCubit.get(context).changeTypeIndex(index: 1);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 48.h,
                  width: 155.w,
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).typeIndex == 1
                        ? kButtonColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.provider.tr(),
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppCubit.get(context).typeIndex == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
