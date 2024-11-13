import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/favourites/widgets/favourites_items_list_view.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../generated/locale_keys.g.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          title: LocaleKeys.favourite.tr(),
          scaffoldKey: scaffoldKey,
          widget2: Container(),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
      body: const FavouritesItemsListView(),
    );
  }
}
