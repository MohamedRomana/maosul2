/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/Fonts/Cairo-Bold.ttf
  String get cairoBold => 'assets/Fonts/Cairo-Bold.ttf';

  /// File path: assets/Fonts/Cairo-ExtraBold.ttf
  String get cairoExtraBold => 'assets/Fonts/Cairo-ExtraBold.ttf';

  /// File path: assets/Fonts/Cairo-Regular.ttf
  String get cairoRegular => 'assets/Fonts/Cairo-Regular.ttf';

  /// File path: assets/Fonts/Cairo-SemiBold.ttf
  String get cairoSemiBold => 'assets/Fonts/Cairo-SemiBold.ttf';

  /// List of all assets
  List<String> get values =>
      [cairoBold, cairoExtraBold, cairoRegular, cairoSemiBold];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/Lang/ar.json
  String get ar => 'assets/Lang/ar.json';

  /// File path: assets/Lang/en.json
  String get en => 'assets/Lang/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/alert.json
  String get alert => 'assets/img/alert.json';

  /// File path: assets/img/empty.json
  String get empty => 'assets/img/empty.json';

  /// File path: assets/img/emptycart.json
  String get emptycart => 'assets/img/emptycart.json';

  /// File path: assets/img/emptyfav.json
  String get emptyfav => 'assets/img/emptyfav.json';

  /// File path: assets/img/emptyorder.json
  String get emptyorder => 'assets/img/emptyorder.json';

  /// File path: assets/img/emptysearch.json
  String get emptysearch => 'assets/img/emptysearch.json';

  /// File path: assets/img/loading.json
  String get loading => 'assets/img/loading.json';

  /// File path: assets/img/login.json
  String get login => 'assets/img/login.json';

  /// File path: assets/img/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/img/logo.png');

  /// File path: assets/img/notifications.json
  String get notifications => 'assets/img/notifications.json';

  /// List of all assets
  List<dynamic> get values => [
        alert,
        empty,
        emptycart,
        emptyfav,
        emptyorder,
        emptysearch,
        loading,
        login,
        logo,
        notifications
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/cart.svg
  String get cart => 'assets/svg/cart.svg';

  /// File path: assets/svg/categories.svg
  String get categories => 'assets/svg/categories.svg';

  /// File path: assets/svg/distance.svg
  String get distance => 'assets/svg/distance.svg';

  /// File path: assets/svg/drawer.svg
  String get drawer => 'assets/svg/drawer.svg';

  /// File path: assets/svg/euro.svg
  String get euro => 'assets/svg/euro.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/orders.svg
  String get orders => 'assets/svg/orders.svg';

  /// File path: assets/svg/price.svg
  String get price => 'assets/svg/price.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// File path: assets/svg/store.svg
  String get store => 'assets/svg/store.svg';

  /// File path: assets/svg/time.svg
  String get time => 'assets/svg/time.svg';

  /// File path: assets/svg/time_history.svg
  String get timeHistory => 'assets/svg/time_history.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// List of all assets
  List<String> get values => [
        cart,
        categories,
        distance,
        drawer,
        euro,
        home,
        orders,
        price,
        search,
        store,
        time,
        timeHistory,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
