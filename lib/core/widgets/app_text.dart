import 'package:flutter/material.dart';
import '../util/styles.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: Styles.textStyle18.copyWith(color: Colors.black),
      
    );
  }
}
