import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';

class FavoritesContainer extends StatelessWidget {
  const FavoritesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: kFourthColor,
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.favourite.tr(),
              style: Styles.textStyle16.copyWith(
                color: kButtonColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Icon(FontAwesomeIcons.solidHeart, color: kButtonColor),
          ],
        ),
      ),
    );
  }
}
