import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/app_text.dart';

class PlacesNearYouListView extends StatelessWidget {
  const PlacesNearYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsetsDirectional.only(top: 20.h, bottom: 11.h, start: 32.w),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: AppText(
              text: LocaleKeys.placesnearyou.tr(),
            ),
          ),
        ),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            itemCount: AppCubit.get(context).near_providers.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 10.w),
            itemBuilder: (context, index) => InkWell(
              onTap: () =>
                  GoRouter.of(context).push(AppRouters.kStoresNameView),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: CachedNetworkImage(
                      imageUrl: AppCubit.get(context).near_providers[index]
                          ['avatar'],
                      width: 200.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 200.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: kButtonColor.withOpacity(0.36),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 70.w,
                                child: Text(
                                  AppCubit.get(context).near_providers[index]
                                      ['name'],
                                  style: Styles.textStyle12.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 80.w),
                              SizedBox(
                                width: 50.w,
                                child: Row(
                                  children: [
                                    Text(
                                      AppCubit.get(context)
                                          .near_providers[index]['rate']
                                          .toString(),
                                      style: const TextStyle(
                                          color: Color(
                                            0xffFC6011,
                                          ),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(width: 4.2.w),
                                    const Icon(
                                      FontAwesomeIcons.solidStar,
                                      color: Color(
                                        0xffFC6011,
                                      ),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 120.w,
                            child: Text(
                              '${AppCubit.get(context).near_providers[index]['country']} - ${AppCubit.get(context).near_providers[index]['city']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
