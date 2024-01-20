import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_one/common/navigation.dart';
import 'package:project_one/constants/constants.dart';
import 'package:project_one/constants/assets_constants.dart';
import 'package:project_one/features/tweet/views/create_tweet_view.dart';
import 'package:project_one/theme/pallete.dart';

class HomeView extends StatefulWidget {
  static route() => CustomRouter(destination: const HomeView()).route();
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  final appBar = UIConstants.appBar();

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  onCreateTweet() {
    Navigator.push(context, CreateTweetScreen.route());
  }

  BottomNavigationBarItem iconItem(String iconName, Color color) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
      iconName,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: IndexedStack(
        index: _page,
        children: UIConstants.bottomTabBarPages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTweet,
        child: const Icon(
          Icons.add,
          color: Pallete.whiteColor,
          size: 28,
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: _page,
          onTap: onPageChange,
          backgroundColor: Pallete.backgroundColor,
          items: [
            _page == 0
                ? iconItem(AssetsConstants.homeFilledIcon, Pallete.blueColor)
                : iconItem(
                    AssetsConstants.homeOutlinedIcon, Pallete.whiteColor),
            _page == 1
                ? iconItem(AssetsConstants.searchIcon, Pallete.blueColor)
                : iconItem(AssetsConstants.searchIcon, Pallete.whiteColor),
            _page == 2
                ? iconItem(AssetsConstants.notifFilledIcon, Pallete.blueColor)
                : iconItem(
                    AssetsConstants.notifOutlinedIcon, Pallete.whiteColor)
          ]),
    );
  }
}
