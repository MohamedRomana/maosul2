import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_drawer.dart';
import 'widgets/image_details_details.dart';
import 'widgets/product_name_list_view.dart';
import 'widgets/stores_name_app_bar.dart';

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
            preferredSize: Size.fromHeight(80.h),
            child: StoresNameAppBar(scaffoldKey: scaffoldKey),
          ),
          body: state is GetStoresDataLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.grey,
                ))
              : DefaultTabController(
                  initialIndex: 0,
                  length: AppCubit.get(context).subSections.length,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: const ImageDetailsStack(),
                      ),
                      Container(
                        color: kPrimaryColor,
                        child: TabBar(
                          onTap: (index) {
                            if (index == 0) {
                              AppCubit.get(context).getStoreData(
                                  providerId: AppCubit.get(context)
                                      .storeData["id"]
                                      .toString());
                            } else {
                              AppCubit.get(context).getProducts(
                                sectionId: AppCubit.get(context)
                                    .subSections[index]["id"]
                                    .toString(),
                              );
                            }
                          },
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
                            (index) => ProductNameListView(
                              sectionId: AppCubit.get(context)
                                  .subSections[index]["id"]
                                  .toString(),
                            ),
                          ),
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
