import 'package:flutter/material.dart';
import 'package:maosul2/Features/start/types/widgets/types_view_body.dart';
import 'package:maosul2/core/constants.dart';

class TypesView extends StatelessWidget {
  const TypesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: TypesViewBody(),
    );
  }
}