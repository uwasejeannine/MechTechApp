import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgetassignment/Onboarding/onboarding_items.dart';
import 'package:widgetassignment/mech_tech.dart';
import 'package:widgetassignment/solid_button.dart';

import '../color_schema.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        bottomSheet: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 30,
          ),
          child: isLastPage
              ? getStarted()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Skip button
                    TextButton(
                      onPressed: () => pageController
                          .jumpToPage(controller.items.length + 1),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    //Indicator
                    SmoothPageIndicator(
                      controller: pageController,
                      count: controller.items.length,
                      onDotClicked: (index) => pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      effect: const WormEffect(
                          activeDotColor: AppColors.textDark,
                          dotHeight: 12,
                          dotWidth: 12),
                    ),
                    //Next button
                    TextButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              alignment: Alignment.topRight,
            ),
          ),
          child: PageView.builder(
              onPageChanged: (index) => setState(
                  () => isLastPage = controller.items.length - 1 == index),
              itemCount: controller.items.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        controller.items[index].image,
                        width: size.width * .6,
                        height: 180,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        controller.items[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        controller.items[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  } //Get started

  Widget getStarted() {
    return CustomButton(
        onTap: () async {
          final pres = await SharedPreferences.getInstance();
          pres.setBool("onboarding", true);
          if (!mounted) return;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MechTechHomePage(),
          ));
        },
        buttonText: "Get started");
  }
}
