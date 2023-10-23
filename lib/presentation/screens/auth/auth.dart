part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.images.authBg.path))),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FadedScaleAnimation(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.images.mainLogo
                      .image(height: 49.h, width: 139.w, color: MyColors.white)
                      .centered(),
                  const Spacer(),
                  MyStrings.authContent.text
                      .size(28)
                      .white
                      .fontWeight(FontWeight.w700)
                      .align(TextAlign.left)
                      .make(),
                  20.h.heightBox,
                  RoundedPrimaryButton(title: MyStrings.login, voidCallback: (){AutoRouter.of(context).push(const LoginRoute());}),
                  5.h.heightBox,
                  ElevatedButton(
                    onPressed: () {AutoRouter.of(context).push(const RegisterRoute());},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: MyColors.white),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: MyStrings.register.text
                        .size(16.sp)
                        .white
                        .fontWeight(FontWeight.w500)
                        .makeCentered(),
                  ),
                  10.h.heightBox
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

