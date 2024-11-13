import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/Features/home_layout/Home/widgets/best_offers_view.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/widgets/app_text.dart';

class BestOffersListView extends StatelessWidget {
  const BestOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: 25.h, bottom: 11.h, start: 19.w),
          child:  Align(
            alignment: AlignmentDirectional.centerStart,
            child: AppText(
              text: LocaleKeys.bestoffers.tr(),
            ),
          ),
        ),
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => GoRouter.of(context).push(AppRouters.kStoresNameView),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: const BestOffersView());
            },
          ),
        ),
      ],
    );
  }
}
