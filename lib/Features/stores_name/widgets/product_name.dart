import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';
import '../../../generated/locale_keys.g.dart';
import 'add_note_bottom_sheet.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return const AddNoteBottomSheet();
          },
        );
      },
      child: Container(
        height: 80.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 60.h,
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: const AssetImage(
                  'assets/images/images.jpeg',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'اسم المنتج',
                  style: Styles.textStyle12.copyWith(color: Colors.black),
                ),
                Text(
                  '‏75ر.س',
                  style: Styles.textStyle12,
                ),
              ],
            ),
            SizedBox(
              width: 110.w,
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 30.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Center(
                  child: Text(
                    LocaleKeys.add.tr(),
                    style: Styles.textStyle14.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
      ),
    );
  }
}
