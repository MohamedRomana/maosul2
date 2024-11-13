import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/Features/home_layout/stores/widgets/stores_list_view.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/util/app_router.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_drawer.dart';

class StoresView extends StatelessWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(133.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.stores.tr(),
          widget1: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
      ),
      body: GestureDetector(
          onTap: () =>
              GoRouter.of(context).pushReplacement(AppRouters.kStoresNameView),
          child: const StoresListView()),
    );
  }
}
