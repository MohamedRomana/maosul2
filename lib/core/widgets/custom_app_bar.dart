import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/app_router.dart';
import '../../generated/locale_keys.g.dart';
import '../util/styles.dart';

final _searchController = TextEditingController();

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final Widget? widget;
  final Widget? widget1;
  final Widget? widget2;
  final double? right;
  final double? left;
  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    required this.title,
    this.widget,
    this.widget1,
    this.widget2,
    this.right,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 125.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => scaffoldKey.currentState!.openDrawer(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SvgPicture.asset(
                            "assets/svg/Shape 547.svg",
                            height: 15.h,
                            width: 19.w,
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style: Styles.textStyle18.copyWith(color: Colors.black),
                      ),
                      const Spacer(),
                      widget ??
                          InkWell(
                            onTap: () => GoRouter.of(context)
                                .push(AppRouters.kNotificationView),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: SvgPicture.asset(
                              'assets/svg/ic_notifications_24px.svg',
                              height: 25.h,
                            ),
                          ),
                      widget1 ??
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: InkWell(
                              onTap: () {
                                if (AppCubit.get(context).typeIndex == 0) {
                                  GoRouter.of(context)
                                      .push(AppRouters.kHomeLayout);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 21.sp,
                              ),
                            ),
                          )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 105.h,
              right: right ?? 16.w,
              left: left ?? 16.w,
              child: widget2 ??
                  SizedBox(
                    width: 343.w,
                    height: 40.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.3), // Shadow color
                              blurRadius: 20, // Spread of the shadow
                              offset: const Offset(2, 9),
                            ),
                          ],
                        ),
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          cursorColor: kThirdColor,
                          controller: _searchController,
                          onSubmitted: (value) {
                            if (_searchController.text.isNotEmpty) {
                              GoRouter.of(context).push(AppRouters.kSearchView);
                              _searchController.clear();
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: kThirdColor,
                            ),
                            hintText: LocaleKeys.writehere.tr(),
                            hintStyle: Styles.textStyle12,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              borderSide: const BorderSide(
                                color: kButtonColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              borderSide: const BorderSide(
                                color: kButtonColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              borderSide: const BorderSide(
                                color: kButtonColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          ],
        );
      },
    );
  }
}
