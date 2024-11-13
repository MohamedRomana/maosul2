import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/util/styles.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../generated/locale_keys.g.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return  Scaffold(
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
      body: Center(child: Text('لا يوجد عمليات بحث', style: Styles.textStyle24.copyWith(color: Colors.grey),)),
    );
  }
}