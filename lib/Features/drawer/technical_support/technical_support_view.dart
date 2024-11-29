import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';
import 'package:maosul2/core/cache/cache_helper.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../custom_drawer.dart';

class TechnicalSupportView extends StatelessWidget {
  const TechnicalSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      bottomNavigationBar: CacheHelper.getUserType() == "client"
          ? const CustomBottomNav()
          : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115.h),
        child: CustomAppBar(
            scaffoldKey: scaffoldKey,
            title: LocaleKeys.technicalsupport.tr(),
            widget2: Container()),
      ),
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/61ac84c880b2296cfdd01712/1fm4udcia',
        visitor: TawkVisitor(
          name: AppCubit.get(context).userInfo["first_name"] ?? "",
          email: AppCubit.get(context).userInfo["email"] ?? "",
        ),
        onLoad: () {
          debugPrint('Hello Tawk!');
        },
        onLinkTap: (String url) {
          debugPrint(url);
        },
        placeholder: Padding(
          padding: EdgeInsets.all(16.w),
          child: Shimmer.fromColors(
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
          ),
        ),
      ),
    );
  }
}
