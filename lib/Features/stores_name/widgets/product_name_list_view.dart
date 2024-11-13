import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_name.dart';

class ProductNameListView extends StatelessWidget {
  const ProductNameListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.only(right: 16.w,left: 16.h, bottom: 23.h),
      itemBuilder: (context, index) {
        return const ProductName();
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
    );
  }
}
