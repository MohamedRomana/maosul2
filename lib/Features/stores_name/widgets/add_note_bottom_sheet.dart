import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maosul2/core/cache/cache_helper.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/core/widgets/custom_text_field.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/flash_message.dart';

final notesController = TextEditingController();

class AddNoteBottomSheet extends StatefulWidget {
  final Map product;
  const AddNoteBottomSheet({super.key, required this.product});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  @override
  void initState() {
    notesController.clear();
    AppCubit.get(context).count = 1;
    AppCubit.get(context)
        .getProductData(serviceId: widget.product["id"].toString());
    super.initState();
  }

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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: AppCachedImage(
                                image: AppCubit.get(context)
                                        .productData["first_image"] ??
                                    "",
                                height: 70.h,
                                width: 70.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 10.w),
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
                                        width: 100.w,
                                        child: Text(
                                          AppCubit.get(context)
                                                  .productData["title"] ??
                                              "",
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
                                            onPressed: () {
                                              if (CacheHelper.getUserId() !=
                                                  "") {
                                                AppCubit.get(context).addFav(
                                                    serviceId:
                                                        AppCubit.get(context)
                                                            .productData["id"]
                                                            .toString());
                                              } else {
                                                showFlashMessage(
                                                  context: context,
                                                  type: FlashMessageType.error,
                                                  message: LocaleKeys.login_first.tr(),
                                                );
                                              }
                                            },
                                            icon: Icon(
                                              (AppCubit.get(context)
                                                              .productData[
                                                          'is_favourite'] ??
                                                      false)
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: kButtonColor,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 3.h),
                                            decoration: BoxDecoration(
                                              color: kButtonColor,
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color(0xffF9BF00),
                                                    size: 20.5,
                                                  ),
                                                  SizedBox(width: 2.5.w),
                                                  Text(
                                                    AppCubit.get(context)
                                                        .productData["rate"]
                                                        .toString(),
                                                    style: Styles.textStyle12
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 230.w,
                                  child: Text(
                                    AppCubit.get(context).productData["desc"] ??
                                        "",
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
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          '${AppCubit.get(context).productData["price"]} ر.س',
                          style:
                              Styles.textStyle14.copyWith(color: kButtonColor),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.h,
                    indent: 16.w,
                    endIndent: 16.w,
                    color: const Color(0xffBFDBCE),
                  ),
                  CustomTextField(
                    hintText: LocaleKeys.recordyourobservations.tr(),
                    controller: notesController,
                    maxLines: 3,
                    borderRadius: BorderRadius.circular(10.r),
                    focusedColor: kButtonColor,
                    enabledColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      AppCubit.get(context).addToCart(
                        serviceId:
                            AppCubit.get(context).productData["id"].toString(),
                        notes: notesController.text,
                      );
                    },
                    child: state is AddToCartLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            LocaleKeys.addtheproduct.tr(),
                            style: Styles.textStyle16
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
