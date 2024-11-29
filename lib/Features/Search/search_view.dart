import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import '../../core/constants.dart';
import '../../core/widgets/app_cache_image.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../drawer/custom_drawer.dart';
import '../../generated/locale_keys.g.dart';
import '../stores_name/widgets/add_note_bottom_sheet.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
            key: scaffoldKey,
            drawer: const CustomDrawer(),
            bottomNavigationBar: const CustomBottomNav(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: CustomAppBar(
                title: LocaleKeys.search.tr(),
                scaffoldKey: scaffoldKey,
                widget2: Container(),
              ),
            ),
            body: state is GetSearchLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.grey,
                  ))
                : AppCubit.get(context).searchList.isEmpty
                    ? Center(
                        child: Text(
                        LocaleKeys.no_searches.tr(),
                        style: Styles.textStyle24.copyWith(color: Colors.grey),
                      ))
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                          right: 16.w,
                          left: 16.w,
                          top: 16.h,
                          bottom: 20.h,
                        ),
                        itemCount: AppCubit.get(context).searchList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10.w,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => AddNoteBottomSheet(
                                        product: AppCubit.get(context)
                                            .searchList[index]),
                                  );
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  height: 222.h,
                                  width: 165.w,
                                  decoration: BoxDecoration(
                                    color: kFourthColor,
                                    borderRadius: BorderRadius.circular(10.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            topRight: Radius.circular(10.r)),
                                        child: AppCachedImage(
                                          image: AppCubit.get(context)
                                              .searchList[index]["first_image"],
                                          height: 140.h,
                                          width: double.infinity,
                                        ),
                                      ),
                                      SizedBox(height: 16.w),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 8.w),
                                            child: Text(
                                              AppCubit.get(context)
                                                  .searchList[index]["title"],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 8.w),
                                            child: Text(
                                              "${AppCubit.get(context).searchList[index]["price"]} ر.س",
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsetsDirectional.only(
                                                end: 9.w),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 4.h,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13.r),
                                              color: kButtonColor,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 18.sp,
                                                ),
                                                Text(
                                                  AppCubit.get(context)
                                                      .searchList[index]["rate"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }));
      },
    );
  }
}
