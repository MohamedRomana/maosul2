import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/util/app_router.dart';
import '../../../core/widgets/custom_drawer.dart';
import 'widgets/favorites_container.dart';
import 'widgets/user_details.dart';
import 'widgets/user_name_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.myaccount.tr(),
          widget2: const UserNameProfile(),
          widget1: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
      ),
      body: Column(
        children: [
          const UserDetails(),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouters.kFavouritesView);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const FavoritesContainer(),
          )
        ],
      ),
    );
  }
}
