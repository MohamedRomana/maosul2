import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/favourites/widgets/favourites_items.dart';

class FavouritesItemsListView extends StatelessWidget {
  const FavouritesItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: 16.h,
          bottom: 20.h,
        ),
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10.w,
        ),
        itemBuilder: (context, index) {
          return const FavouritesItems();
        });
  }
}
