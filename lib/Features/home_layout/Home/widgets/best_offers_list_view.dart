import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/app_text.dart';

class BestOffersListView extends StatelessWidget {
  const BestOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsetsDirectional.only(top: 25.h, bottom: 11.h, start: 19.w),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: AppText(
              text: LocaleKeys.bestoffers.tr(),
            ),
          ),
        ),
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            itemCount: AppCubit.get(context).best_providers.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () =>
                    GoRouter.of(context).push(AppRouters.kStoresNameView),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl: AppCubit.get(context).best_providers[index]
                            ['avatar'],
                        width: 140.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 140.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: kButtonColor.withOpacity(0.36),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      child: Container(
                        width: 35.86.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                            bottomLeft: Radius.circular(5.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${AppCubit.get(context).best_providers[index]['discount']}%',
                            style: Styles.textStyle12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      right: 10.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppCubit.get(context).best_providers[index]['name'],
                            style: Styles.textStyle12.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 110.w,
                            child: Text(
                              '${AppCubit.get(context).best_providers[index]['country']} - ${AppCubit.get(context).best_providers[index]['city']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
