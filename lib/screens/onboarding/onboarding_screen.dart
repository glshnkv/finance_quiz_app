import 'package:auto_route/auto_route.dart';
import 'package:finance_quiz_app/router/router.dart';
import 'package:finance_quiz_app/theme/colors.dart';
import 'package:finance_quiz_app/theme/textstyles.dart';
import 'package:finance_quiz_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: AppColors.red,
                  dotColor: AppColors.red10,
                  dotHeight: 3,
                  dotWidth: MediaQuery.of(context).size.width * 0.3,
                  radius: 20,
                ),
              ),
            ),
            Spacer(flex: 1),
            Container(
              height: 500,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/onboarding/1.jpg'),
                        RichText(
                            text: TextSpan(
                          text: 'Welcome to ',
                          style: AppTextStyles.h2(AppColors.black),
                          children: [
                            TextSpan(
                              text: 'our app!',
                              style: AppTextStyles.h2(AppColors.red),
                            )
                          ],
                        )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'Discover a new level of financial management and fun with our app!',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text2(AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/onboarding/2.jpg'),
                        RichText(
                            text: TextSpan(
                              text: 'Your cash flow is ',
                              style: AppTextStyles.h2(AppColors.black),
                              children: [
                                TextSpan(
                                  text: 'under control',
                                  style: AppTextStyles.h2(AppColors.red),
                                )
                              ],
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'Keep track of your income with our convenient tools. Receive notifications when money arrives and plan your finances easily',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text2(AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/onboarding/3.jpg'),
                        RichText(
                            text: TextSpan(
                              text: 'Stay ',
                              style: AppTextStyles.h2(AppColors.black),
                              children: [
                                TextSpan(
                                  text: 'informed ',
                                  style: AppTextStyles.h2(AppColors.red),
                                ),
                                TextSpan(
                                  text: 'and ',
                                ),
                                TextSpan(
                                  text: 'enjoy',
                                  style: AppTextStyles.h2(AppColors.red),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'Read the latest news and articles about finance. Enjoy and mini-games to brighten your day',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text2(AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: ActionButtonWidget(
        text: 'Next',
        width: MediaQuery.of(context).size.width * 0.9,
        onTap: () {
          isLastPage ? context.router.push(MainRoute()) :
          controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
