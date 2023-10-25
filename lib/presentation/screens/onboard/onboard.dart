part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnBoardViewModel onBoardViewModel = OnBoardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadedScaleAnimation(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Assets.images.mainLogo.image(
                    color: Colors.black,
                    height: 42.h,
                    width: 139.w,
                  ),
                ),
                PageView(
                  controller: onBoardViewModel.pageController,
                  children: const [
                    OnBoardFirst(),
                    OnBoardSecond(),
                    OnBoardThird()
                  ],
                ).expand(),
                63.h.heightBox,
                RoundedPrimaryButton(
                  title: MyStrings.getStarted,
                  voidCallback: () {
                    AutoRouter.of(context).push(
                      const AuthRoute(),
                    );
                  },
                ),
                30.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onBoardViewModel.pageController.jumpToPage(3);
                      },
                      child: MyStrings.skip.text
                          .size(16.sp)
                          .fontWeight(FontWeight.w700)
                          .color(MyColors.primaryColor)
                          .make(),
                    ),
                    SmoothPageIndicator(
                      controller: onBoardViewModel.pageController,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        activeDotColor: MyColors.primaryColor,
                      ),
                    ),
                    MyStrings.next.text
                        .size(16.sp)
                        .fontWeight(FontWeight.w700)
                        .color(MyColors.primaryColor)
                        .make(),
                  ],
                ),
                20.h.heightBox
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
