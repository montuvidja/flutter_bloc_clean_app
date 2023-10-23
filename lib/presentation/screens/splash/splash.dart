part of 'splash_import.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToOnBoard();
    super.initState();
  }

  moveToOnBoard() async {
    await Future.delayed(const Duration(seconds: 5), () {
      AutoRouter.of(context).push(const OnBoardRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          child: Assets.images.mainLogo.image(
            height: 42.h,
            width: 139.w,
          ),
        ),
      ),
    );
  }
}
