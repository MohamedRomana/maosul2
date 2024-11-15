import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../core/util/app_router.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_drawer.dart';
import 'widgets/product_name_list_view.dart';

class StoresNameView extends StatefulWidget {
  final int id;
  const StoresNameView({super.key, required this.id});

  @override
  State<StoresNameView> createState() => _StoresNameViewState();
}

class _StoresNameViewState extends State<StoresNameView> {
  @override
  void initState() {
    AppCubit.get(context).getStoreData(providerId: widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          bottomNavigationBar: const CustomBottomNav(),
          drawer: const CustomDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                children: [
                  InkWell(
                    onTap: () => scaffoldKey.currentState!.openDrawer(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SvgPicture.asset(
                        "assets/svg/Shape 547.svg",
                        height: 15.h,
                        width: 19.w,
                      ),
                    ),
                  ),
                  Text(
                    LocaleKeys.storename.tr(),
                    style: Styles.textStyle18.copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      AppCubit.get(context).showNotificationData();
                      GoRouter.of(context).push(AppRouters.kNotificationView);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 29.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: state is GetStoresDataLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : DefaultTabController(
                  initialIndex: 0,
                  length: AppCubit.get(context).subSections.length,
                  child: Column(
                    children: [
                      SizedBox(height: 16.w),
                      Stack(
                        children: [
                          Container(
                            height: 150.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: CachedNetworkImage(
                                imageUrl:
                                    AppCubit.get(context).storeData["avatar"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: 150.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.61),
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                          Positioned(
                            top: 10.h,
                            right: 10.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 3.h),
                              decoration: BoxDecoration(
                                color: kButtonColor,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffF9BF00),
                                    size: 20.5,
                                  ),
                                  SizedBox(width: 2.5.w),
                                  Text(
                                    AppCubit.get(context)
                                        .storeData['rate']
                                        .toString(),
                                    style: Styles.textStyle12
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20.h,
                            right: 20.w,
                            left: 20.w,
                            child: Column(
                              children: [
                                Text(
                                  AppCubit.get(context).storeData['name'],
                                  style: Styles.textStyle12
                                      .copyWith(color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svg/ic_my_location_24px.svg'),
                                    Text(
                                      'يبعد ${AppCubit.get(context).storeData['distance']} كم',
                                      style: Styles.textStyle10,
                                    ),
                                    SvgPicture.asset(
                                        'assets/svg/ic_watch_later_24px.svg'),
                                    Text(
                                      'وقت التوصيل : ${AppCubit.get(context).storeData['delivery_time']} د',
                                      style: Styles.textStyle10,
                                    ),
                                    SvgPicture.asset(
                                        'assets/svg/Path 3387.svg'),
                                    Text(
                                      'التوصيل : ${AppCubit.get(context).storeData['delivery']} ر.س',
                                      style: Styles.textStyle10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.w),
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
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: -15.w),
                          indicator: BoxDecoration(
                            color: kButtonColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          unselectedLabelColor: Colors.grey,
                          tabs: List.generate(
                            AppCubit.get(context).subSections.length,
                            (index) => Tab(
                                text: AppCubit.get(context).subSections[index]
                                    ["title"]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: List.generate(
                              AppCubit.get(context).subSections.length,
                              (index) => const ProductNameListView()),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
