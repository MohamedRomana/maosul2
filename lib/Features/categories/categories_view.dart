import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/categories/widgets/categories_gride_view.dart';
import 'package:maosul2/core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../drawer/custom_drawer.dart';
import '../../generated/locale_keys.g.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(133.h),
          child: CustomAppBar(
              scaffoldKey: scaffoldKey, title: LocaleKeys.categories.tr())),
      bottomNavigationBar: const CustomBottomNav(),
      body: const CategoriesGrideView(),
    );
  }
}
