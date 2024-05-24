import 'dart:async';

import 'package:d/models/banner.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  List<dynamic> banners;
   CustomPageView({super.key,required this.banners});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late PageController pageController;

  late Timer time;

  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: currentPage);
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      time = timer;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    time.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.banners.length,
        itemBuilder: (BuildContext context, int index) {
          BannerAd banner = widget.banners[index];
          return InkWell(
            onTap:()=>print(banner.id!),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 4.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(banner.image!),
                  fit: BoxFit.fill,
                ),
                // border: Border.all(width: 2.0),
                borderRadius:
                const BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
