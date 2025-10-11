import 'package:eventlyapp/onBording_Screens/screen_one.dart';
import 'package:eventlyapp/onBording_Screens/screen_three.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'screen_two.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
          ),
          child: Column(
            children: [
              Image.asset(AppAssets.onbordinglogo),
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      children: [
                        ScreenOne(),
                        ScreenTwo(),
                        ScreenThree(),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      alignment: Alignment(0, 0.9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back button
                          currentPageIndex > 0
                              ? InkWell(
                                  onTap: () {
                                    _pageController.previousPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColor.primaryLightColor,
                                      size: 24,
                                    ),
                                  ),
                                )
                              : SizedBox(width: width * 0.1),

                          SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              dotColor: Colors.black,
                              activeDotColor: AppColor.primaryLightColor,
                              dotHeight: height * 0.01,
                              dotWidth: width * 0.02,
                              expansionFactor: 3,
                              spacing: width * 0.015,
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              if (currentPageIndex == 2) {
                                _handleFinish();
                              } else {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: currentPageIndex == 2
                                  ? Text("Finish",
                                      style: AppStyle.bold16Primary)
                                  : Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.primaryLightColor,
                                      size: 24,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFinish() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
  }
}
