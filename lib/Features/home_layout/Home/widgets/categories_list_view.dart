import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/Features/home_layout/Home/widgets/categories_list.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/app_text.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 23.w, right: 23.w, top: 26.h, bottom: 11.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: LocaleKeys.categories.tr()),
              InkWell(
                onTap: () =>
                    GoRouter.of(context).push(AppRouters.kCategoriesView),
                child: Text(
                  LocaleKeys.viewall.tr(),
                  style: Styles.textStyle12.copyWith(color: kButtonColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () =>
                    AppCubit.get(context).changeScreenIndex(index: 0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: const CategoriesList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
