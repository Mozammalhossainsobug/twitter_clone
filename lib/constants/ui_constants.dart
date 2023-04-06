import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/theme/pallete.dart';

import 'assets_constants.dart';


class UIConstants{
  static AppBar appBar() {
    return AppBar(
        title: Center(
          child: SvgPicture.asset(
            AssetsConstants.twitterLogo,
          color: Pallete.blueColor,
            height: 30,
          ),
        ),

    );
  }
  static List<Widget> bottomTabBarPages = [
    Text('Feed Screen'),
    Text('Search Screen'),
    Text('Notification Screen'),
  ];
}
