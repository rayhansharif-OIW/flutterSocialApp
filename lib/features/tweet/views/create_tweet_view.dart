import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_one/common/common.dart';
import 'package:project_one/constants/constants.dart';
import 'package:project_one/core/utils.dart';
import 'package:project_one/features/auth/controller/auth_controller.dart';
import 'package:project_one/theme/pallete.dart';

class CreateTweetScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateTweetScreen(),
      );

  const CreateTweetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTweetScreenState();
}

class _CreateTweetScreenState extends ConsumerState<CreateTweetScreen> {
  final tweetTextController = TextEditingController();
  List<File> images = [];
  @override
  void dispose() {
    super.dispose();
    tweetTextController.dispose();
  }

  void onPickImages() async {
    images = await pickImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    print("current user: ${currentUser == null ? "null" : currentUser.name}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: [
          RoundedSmallButton(
            ontap: () {
              Navigator.pop(context);
            },
            label: 'Tweet',
            backgroundColor: Pallete.blueColor,
            textColor: Pallete.whiteColor,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  currentUser == null
                      ? const Loader()
                      : CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.profilePic),
                          radius: 30,
                        ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: tweetTextController,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: const InputDecoration(
                          hintText: "what's happening?",
                          hintStyle: TextStyle(color: Pallete.greyColor)),
                      maxLines: null,
                    ),
                  )
                ],
              ),
              if (images.isNotEmpty)
                CarouselSlider(
                  items: images
                      .map(
                        (file) => Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Image.file(file)),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 400,
                    enableInfiniteScroll: false,
                  ),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Pallete.greyColor,
              width: 0.3,
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: onPickImages,
                child: SvgPicture.asset(AssetsConstants.galleryIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15,
              ),
              child: SvgPicture.asset(AssetsConstants.gifIcon),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15,
              ),
              child: SvgPicture.asset(AssetsConstants.emojiIcon),
            ),
          ],
        ),
      ),
    );
  }
}
