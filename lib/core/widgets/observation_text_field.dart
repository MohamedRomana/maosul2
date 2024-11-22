import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../../generated/locale_keys.g.dart';
import '../util/styles.dart';

class ObservationTextField extends StatelessWidget {
  final TextEditingController notesController;

  const ObservationTextField({
    super.key, required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 9.h),
          child: Row(
            children: [
              Text(
                LocaleKeys.observations.tr(),
                style: Styles.textStyle16.copyWith(color: kButtonColor),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                '(${LocaleKeys.optional.tr()})',
                style: Styles.textStyle10.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 343.w,
          height: 80.h,
          child: TextField(
            maxLines: 5,
            controller: notesController,
            decoration: InputDecoration(
              hintText: LocaleKeys.recordyourobservations.tr(),
              hintStyle: Styles.textStyle12.copyWith(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: kThirdColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: kThirdColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
