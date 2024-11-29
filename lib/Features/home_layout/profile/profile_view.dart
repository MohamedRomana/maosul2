import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cache/cache_helper.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/core/widgets/login_first.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../drawer/custom_drawer.dart';
import 'widgets/favorites_container.dart';
import 'widgets/user_details.dart';
import 'widgets/user_name_profile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    if (AppCubit.get(context).userInfo.isEmpty &&
        CacheHelper.getUserId() != "") {
      AppCubit.get(context).showUser();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(115.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.myaccount.tr(),
              widget2: Container(),
              widget1: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
          ),
          body: CacheHelper.getUserId() == ""
              ? const LoginFirst()
              : state is ShowUserLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.grey,
                    ))
                  : Column(
                      children: [
                        const UserNameProfile(),
                        SizedBox(height: 24.h),
                        const UserDetails(),
                        SizedBox(height: 24.h),
                        const FavoritesContainer()
                      ],
                    ),
        );
      },
    );
  }
}
