// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomCountryPicker extends StatelessWidget {
//   const CustomCountryPicker({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.only(start: 20.w),
//       child: CountryPickerDropdown(
//         initialValue: 'SA',
//         itemBuilder: _buildDropdownItem,
//         sortComparator: (Country a, Country b) =>
//             a.isoCode.compareTo(b.isoCode),
//         onValuePicked: (Country country) {
//           debugPrint(country.phoneCode);
//         },
//       ),
//     );
//   }
// }

// Widget _buildDropdownItem(Country country) => SizedBox(
//       width: 85.w,
//       child: FittedBox(
//         child: Row(
//           children: <Widget>[
//             CountryPickerUtils.getDefaultFlagImage(country),
//             // SizedBox(width: 8.w),
//             Text("+${country.phoneCode}(${country.isoCode})"),
//           ],
//         ),
//       ),
//     );