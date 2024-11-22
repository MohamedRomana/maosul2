import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/favourites/widgets/favourites_items_list_view.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import '../../core/util/styles.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../generated/locale_keys.g.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.h),
            child: CustomAppBar(
              title: LocaleKeys.favourite.tr(),
              scaffoldKey: scaffoldKey,
              widget2: Container(),
            ),
          ),
          bottomNavigationBar: const CustomBottomNav(),
          body: state is ShowFavLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.grey,
                ))
              : AppCubit.get(context).favList.isEmpty
                  ? Center(
                      child: Text(
                      'لا يوجد عمليات في المفضلة',
                      style: Styles.textStyle24.copyWith(color: Colors.grey),
                    ))
                  : const FavouritesItemsListView(),
        );
      },
    );
  }
}
