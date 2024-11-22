import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/categories/categories_view.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/app_text.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 23.w, right: 23.w, top: 26.h, bottom: 11.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: LocaleKeys.categories.tr()),
                  InkWell(
                    onTap: () =>
                        AppRouter.navigateTo(context, const CategoriesView()),
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
                itemCount: AppCubit.get(context).sections.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      AppCubit.get(context).changeScreenIndex(index: 0);
                      AppCubit.get(context).storessData(
                        sectionId: AppCubit.get(context)
                            .sections[index]["id"]
                            .toString(),
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 40.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppCachedImage(
                            image: AppCubit.get(context).sections[index]
                                ["image"],
                            height: 25.h,
                            width: 24.w,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            AppCubit.get(context).sections[index]["title"],
                            style: Styles.textStyle12.copyWith(
                              color: kButtonColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
