import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';

class ProviderImages extends StatelessWidget {
  const ProviderImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  LocaleKeys.id_photo.tr(),
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
                SizedBox(height: 10.h),
                AppCachedImage(
                  image: AppCubit.get(context).userInfo["id_image"],
                  height: 100.h,
                  width: 100.w,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  LocaleKeys.license_photo.tr(),
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
                SizedBox(height: 10.h),
                AppCachedImage(
                  image: AppCubit.get(context).userInfo["license_image"],
                  height: 100.h,
                  width: 100.w,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  LocaleKeys.car_photo.tr(),
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
                SizedBox(height: 10.h),
                AppCachedImage(
                  image: AppCubit.get(context).userInfo["ecommercy_image"],
                  height: 100.h,
                  width: 100.w,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
