import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_one/constants/assets_constants.dart';
import 'package:project_one/theme/pallete.dart';

import '../common/common.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        colorFilter: const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn),
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static LoadingPage cerculer() {
    return const LoadingPage();
  }

  static List<Widget> bottomTabBarPages = [
    Text('home Screen'),
    Text('Search Screen'),
    Text('Notifiation Screen'),
  ];
}
