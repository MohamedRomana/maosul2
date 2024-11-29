import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cache/cache_helper.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants.dart';
import '../../../core/util/assets_data.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../generated/locale_keys.g.dart';
import '../custom_drawer.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomDrawer(),
          bottomNavigationBar: CacheHelper.getUserType() == "client"
              ? const CustomBottomNav()
              : null,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.privacypolicy.tr(),
              widget2: Container(
                height: 112.h,
                width: 343.w,
                decoration: BoxDecoration(
                  color: kFourthColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Image.asset(
                    AssetsData.logo,
                    height: 80.h,
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                end: 16.w,
                bottom: 10.h,
              ),
              child: state is! ConditionLoading &&
                      AppCubit.get(context).conditionTitle == ""
                  ? Shimmer.fromColors(
                      baseColor: kButtonColor,
                      highlightColor: Colors.grey,
                      child: Container(
                        height: 500.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          color: kPrimaryColor.withOpacity(.1),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      AppCubit.get(context).conditionTitle,
                      style: TextStyle(fontSize: 14.sp),
                      textAlign: TextAlign.center,
                      maxLines: 100,
                    ),
            ),
          ),
        );
      },
    );
  }
}
