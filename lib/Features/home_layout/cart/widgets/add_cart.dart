import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';

class AddCart extends StatefulWidget {
  const AddCart({
    super.key,
  });

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  bool _isVisible = true;
  void _deleteCard() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            _isVisible
                ? Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 80.h,
                          width: 343.w,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 60.h,
                                    child: CircleAvatar(
                                      radius: 50.r,
                                      backgroundImage: const AssetImage(
                                          'assets/images/images.jpeg'),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'اسم المنتج',
                                        style: Styles.textStyle12.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 11.w),
                                      Text(
                                        '‏75ر.س',
                                        style: Styles.textStyle12,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
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
                                      SizedBox(
                                        width: 47.w,
                                        height: 30.h,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                '${AppCubit.get(context).cartIndex}',
                                            hintStyle: Styles.textStyle12
                                                .copyWith(color: Colors.black),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                              borderSide: const BorderSide(
                                                  color: kThirdColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                              borderSide: const BorderSide(
                                                  color: kThirdColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
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
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                top: -10.h,
                                left: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    _deleteCard();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 12.sp,
                                    color: const Color(0xffEF0404),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text('')
          ],
        );
      },
    );
  }
}
