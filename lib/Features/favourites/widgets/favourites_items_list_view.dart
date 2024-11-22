import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/stores_name/widgets/add_note_bottom_sheet.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class FavouritesItemsListView extends StatelessWidget {
  const FavouritesItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              top: 16.h,
              bottom: 20.h,
            ),
            itemCount: AppCubit.get(context).favList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => AddNoteBottomSheet(
                            product: AppCubit.get(context).favList[index]),
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 222.h,
                      width: 165.w,
                      decoration: BoxDecoration(
                        color: kFourthColor,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r)),
                            child: AppCachedImage(
                              image: AppCubit.get(context).favList[index]
                                  ['first_image'],
                              height: 150.h,
                              width: 165.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: -10.w,
                            child: ElevatedButton(
                              onPressed: () {
                                AppCubit.get(context)
                                    .changeRemoveFavIndex(index: index);
                                AppCubit.get(context).removeFav(
                                    serviceId: AppCubit.get(context)
                                        .favList[index]['id']
                                        .toString(),
                                    index: index);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kButtonColor,
                                shape: const CircleBorder(),
                                minimumSize: Size(30.w, 30.h),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 9.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 5.w),
                                    child: Text(
                                      AppCubit.get(context).favList[index]
                                          ['title'],
                                      style: Styles.textStyle14.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${AppCubit.get(context).favList[index]['price']}.س',
                                        style: Styles.textStyle12,
                                      ),
                                      SizedBox(
                                        width: 61.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 3.h),
                                        decoration: BoxDecoration(
                                          color: kButtonColor,
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                        ),
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
                                                  .favList[index]['rate']
                                                  .toString(),
                                              style: Styles.textStyle12
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
