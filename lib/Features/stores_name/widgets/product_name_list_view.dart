import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/stores_name/widgets/add_note_bottom_sheet.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';
import '../../../generated/locale_keys.g.dart';

class ProductNameListView extends StatelessWidget {
  const ProductNameListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: AppCubit.get(context).products.length,
          padding: EdgeInsets.only(right: 16.w, left: 16.h, bottom: 23.h),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const AddNoteBottomSheet();
                  },
                );
              },
              child: Container(
                height: 80.h,
                width: 343.w,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: CachedNetworkImage(
                          imageUrl: AppCubit.get(context).products[index]
                              ['first_image'],
                          fit: BoxFit.fill,
                          height: 60.h,
                          width: 60.w,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppCubit.get(context).products[index]['title'],
                            style: Styles.textStyle12
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            '${AppCubit.get(context).products[index]['price']} ر.س',
                            style: Styles.textStyle12,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 30.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.add.tr(),
                            style: Styles.textStyle14
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
        );
      },
    );
  }
}
