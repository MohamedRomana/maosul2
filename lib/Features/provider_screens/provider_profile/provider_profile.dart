import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/provider_screens/provider_profile/widgets/provider_details.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../drawer/custom_drawer.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/provider_images.dart';
import 'widgets/provider_name_profile.dart';

class ProviderProfile extends StatefulWidget {
  const ProviderProfile({super.key});

  @override
  State<ProviderProfile> createState() => _ProviderProfileState();
}

class _ProviderProfileState extends State<ProviderProfile> {
  @override
  void initState() {
    AppCubit.get(context).showUser();
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
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
                scaffoldKey: scaffoldKey,
                title: LocaleKeys.myaccount.tr(),
                widget2: Container()),
          ),
          body: state is ShowUserLoading
              ? Center(
                  child: Container(
                  height: 600,
                  width: 343,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  )
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const ProviderNameProfile(),
                      SizedBox(height: 20.h),
                      const ProviderDetails(),
                      SizedBox(height: 20.h),
                      const ProviderImages()
                    ],
                  ),
                ),
        );
      },
    );
  }
}
