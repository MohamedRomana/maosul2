import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_drawer.dart';
import 'widgets/stores_name_time.dart';
import 'widgets/product_name_list_view.dart';

List tabs = [
  'الاكثر مبيعا',
  'اسم القسم',
  'اسم القسم',
  'اسم القسم',
  'اسم القسم',
  'اسم القسم',
  'اسم القسم',
  'اسم القسم',
  'اسم القسم',
  'اسم القسم',
];

class StoresNameView extends StatelessWidget {
  const StoresNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: const CustomBottomNav(),
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(225.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.storename.tr(),
          widget2: const StoresNameTime(),
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: tabs.length,
        child: Column(
          children: [
            Container(
              color: kPrimaryColor,
              child: TabBar(
                onTap: (index) {},
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
                labelColor: Colors.white,
                labelStyle: Styles.textStyle12,
                indicatorColor: kButtonColor,
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.symmetric(horizontal: -15.w),
                indicator: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                unselectedLabelColor: Colors.grey,
                tabs: List.generate(
                  tabs.length,
                  (index) => Tab(text: tabs[index]),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                    tabs.length, (index) => const ProductNameListView()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
