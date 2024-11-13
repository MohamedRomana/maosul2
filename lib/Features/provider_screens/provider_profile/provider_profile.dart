import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/provider_screens/provider_profile/widgets/provider_details.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/provider_images.dart';
import 'widgets/provider_name_profile.dart';

class ProviderProfile extends StatelessWidget {
  const ProviderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.myaccount.tr(),
          widget2: const ProviderNameProfile(),
        ),
      ),
      body: Column(
        children: [
          const ProviderDetails(),
          SizedBox(height: 20.h),
          const ProviderImages()
        ],
      ),
    );
  }
}
