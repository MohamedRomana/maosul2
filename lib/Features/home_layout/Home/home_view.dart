import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/Features/home_layout/Home/widgets/categories_list_view.dart';
import 'package:maosul2/Features/home_layout/Home/widgets/places_near_you_list_view.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/util/app_router.dart';
import 'package:maosul2/core/widgets/custom_drawer.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/best_offers_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          title: LocaleKeys.home.tr(),
          widget: Text(
            'شارع الملز - الرياض',
            style: Styles.textStyle12.copyWith(color: kButtonColor),
          ),
          widget1: IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouters.kLocationView);
            },
            icon: Icon(
              Icons.location_on,
              color: kButtonColor,
              size: 25.sp,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 150.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor,
                    blurRadius: 5.r,
                    spreadRadius: 1.r,
                    offset: Offset(0, 5.r),
                  ),
                ],
              ),
              child: Swiper(
                itemBuilder: (context, index) => Image.asset(
                  'assets/images/Mask Group 14.png',
                  height: 150.h,
                  width: 343.w,
                ),
                autoplay: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                curve: Curves.fastOutSlowIn,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: kPrimaryColor,
                    activeColor: kButtonColor,
                    size: 8.r,
                    activeSize: 11.r,
                  ),
                ),
              ),
            ),
            const CategoriesListView(),
            const BestOffersListView(),
            const PlacesNearYouListView(),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }
}
