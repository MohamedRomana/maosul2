import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/home_layout/stores/widgets/stores_list.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const StoresList();
      }, separatorBuilder: ( context,  index) => SizedBox(height: 10.h,),
    );
  }
}
