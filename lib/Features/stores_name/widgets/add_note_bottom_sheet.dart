import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/observation_text_field.dart';
import '../../home_layout/stores/widgets/product-rating.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 419.h,
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 25.h, start: 16.w),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 80.h,
                              child: CircleAvatar(
                                radius: 50.r,
                                backgroundImage: const AssetImage(
                                  'assets/images/images.jpeg',
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          'اسم المنتج',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.textStyle12.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              FontAwesomeIcons.solidHeart,
                                              color: kButtonColor,
                                            ),
                                          ),
                                          const ProductRating(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 230.w,
                                  child: Text(
                                    'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: Styles.textStyle10
                                        .copyWith(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.h,
                      indent: 16.w,
                      endIndent: 16.w,
                      color: const Color(0xffBFDBCE),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            AppCubit.get(context).increseCount();
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(30.w, 30.w),
                              shape: const CircleBorder(),
                              backgroundColor: kButtonColor,
                              iconColor: Colors.white,
                              elevation: 0),
                          child: Icon(
                            Icons.add,
                            size: 15.sp,
                          ),
                        ),
                        Container(
                          width: 47.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Center(
                            child: Text(
                              AppCubit.get(context).count.toString(),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            AppCubit.get(context).decreseCount();
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(30.w, 30.w),
                              shape: const CircleBorder(),
                              backgroundColor: kThirdColor,
                              iconColor: Colors.white,
                              elevation: 0),
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 15.sp,
                          ),
                        ),
                        SizedBox(
                          width: 130.w,
                        ),
                        Text(
                          '‏75ر.س',
                          style:
                              Styles.textStyle14.copyWith(color: kButtonColor),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.h,
                      indent: 16.w,
                      endIndent: 16.w,
                      color: const Color(0xffBFDBCE),
                    ),
                    const ObservationTextField(),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: LocaleKeys.addtheproduct.tr(),
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
