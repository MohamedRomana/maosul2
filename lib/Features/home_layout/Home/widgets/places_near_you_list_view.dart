import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/Features/home_layout/Home/widgets/places_near_you_view.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/util/app_router.dart';
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
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 10.w),
            itemBuilder: (context, index) => InkWell(
                onTap: () =>
                    GoRouter.of(context).push(AppRouters.kStoresNameView),
                child: const PlacesNearYou()),
          ),
        ),
      ],
    );
  }
}
