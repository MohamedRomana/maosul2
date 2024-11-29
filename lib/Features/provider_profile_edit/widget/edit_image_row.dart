import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class EditImageRow extends StatelessWidget {
  final Map userInfo;
  const EditImageRow({
    super.key,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  LocaleKeys.id_photo.tr(),
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
                SizedBox(height: 10.h),
                AppCubit.get(context).identityImage.isNotEmpty
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              height: 90.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(AppCubit.get(context)
                                      .identityImage
                                      .first),
                                ),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            child: InkWell(
                              onTap: () {
                                AppCubit.get(context).removeIdentityImage();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              AppCubit.get(context).getIdentityImage();
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.r),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: SizedBox(
                                  height: 90.w,
                                  width: 90.w,
                                  child: AppCachedImage(
                                      image: userInfo["id_image"]),
                                ),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            child: InkWell(
                              onTap: () {
                                AppCubit.get(context).getIdentityImage();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Icon(
                                Icons.edit,
                                color: kButtonColor,
                                size: 25.sp,
                              ),
                            ),
                          )
                        ],
                      )
              ],
            ),
            Column(
              children: [
                Text(
                  LocaleKeys.license_photo.tr(),
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppCubit.get(context).licenseImage.isNotEmpty
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              height: 90.h,
                              width: 90.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      AppCubit.get(context).licenseImage.first),
                                ),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            child: InkWell(
                              onTap: () {
                                AppCubit.get(context).removeLicenseImage();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              AppCubit.get(context).getLicenseImage();
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.r),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: SizedBox(
                                  height: 90.w,
                                  width: 90.w,
                                  child: AppCachedImage(
                                      image: userInfo["license_image"]),
                                ),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            child: InkWell(
                              onTap: () {
                                AppCubit.get(context).getLicenseImage();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Icon(
                                Icons.edit,
                                color: kButtonColor,
                                size: 25.sp,
                              ),
                            ),
                          )
                        ],
                      )
              ],
            ),
            Column(
              children: [
                Text(
                  LocaleKeys.car_photo.tr(),
                  style: Styles.textStyle14.copyWith(color: kButtonColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppCubit.get(context).carImage.isNotEmpty
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              height: 90.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      AppCubit.get(context).carImage.first),
                                ),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            child: InkWell(
                              onTap: () {
                                AppCubit.get(context).removeCarImage();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              AppCubit.get(context).getCarImage();
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.r),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: SizedBox(
                                  height: 90.w,
                                  width: 90.w,
                                  child: AppCachedImage(
                                      image: userInfo["ecommercy_image"]),
                                ),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            child: InkWell(
                              onTap: () {
                                AppCubit.get(context).getCarImage();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Icon(
                                Icons.edit,
                                color: kButtonColor,
                                size: 25.sp,
                              ),
                            ),
                          )
                        ],
                      )
              ],
            ),
          ],
        );
      },
    );
  }
}
