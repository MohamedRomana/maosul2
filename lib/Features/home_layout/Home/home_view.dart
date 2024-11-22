import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/home_layout/Home/widgets/categories_list_view.dart';
import 'package:maosul2/Features/home_layout/Home/widgets/places_near_you_list_view.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/location/location.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/custom_drawer.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/app_cache_image.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/best_offers_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    AppCubit.get(context).homeData();
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
            preferredSize: Size.fromHeight(133.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.home.tr(),
              widget: AppCubit.get(context).homeAddress == ""
                  ? Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(100.r)),
                    )
                  : Text(
                      AppCubit.get(context).homeAddress,
                      style: Styles.textStyle12.copyWith(color: kButtonColor),
                    ),
              widget1: IconButton(
                onPressed: () {
                  AppRouter.navigateTo(context, const Location());
                },
                icon: Icon(
                  Icons.location_on,
                  color: kButtonColor,
                  size: 25.sp,
                ),
              ),
            ),
          ),
          body: state is GetHomeDataLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.grey),
                )
              : SingleChildScrollView(
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
                          itemBuilder: (context, index) => AppCachedImage(
                            image: AppCubit.get(context).sliders[index]
                                ["image"],
                            height: 10,
                            width: 10,
                          ),
                          autoplay: true,
                          itemCount: AppCubit.get(context).sliders.length,
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
      },
    );
  }
}
