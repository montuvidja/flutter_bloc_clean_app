part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        resizeToAvoidBottomInset: false,
        body: FadedScaleAnimation(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.2,
                  child: Assets.images.mainLogo.image(
                    color: Colors.white,
                    height: 42.h,
                    width: 139.w,
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.h.heightBox,
                        MyStrings.register.text
                            .size(18)
                            .fontWeight(FontWeight.w700)
                            .makeCentered(),
                        50.h.heightBox,
                        MyStrings.email.text
                            .size(14)
                            .fontWeight(FontWeight.w500)
                            .make(),
                        8.h.heightBox,
                        const RoundedCornerTextField(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: MyColors.primaryColor,
                          ),
                          isPassword: false,
                          obscureText: false,
                        ),
                        15.h.heightBox,
                        MyStrings.password.text
                            .size(14)
                            .fontWeight(FontWeight.w500)
                            .make(),
                        8.h.heightBox,
                        const RoundedCornerTextField(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: MyColors.primaryColor,
                          ),
                          isPassword: true,
                          obscureText: true,
                        ),
                        15.h.heightBox,
                        MyStrings.confirmPassword.text
                            .size(14)
                            .fontWeight(FontWeight.w500)
                            .make(),
                        8.h.heightBox,
                        const RoundedCornerTextField(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: MyColors.primaryColor,
                          ),
                          isPassword: true,
                          obscureText: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250,
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                value: false,
                                onChanged: (value) {},
                                title: MyStrings.rememberMe.text
                                    .size(12)
                                    .align(TextAlign.left)
                                    .make(),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                          ],
                        ),
                        30.h.heightBox,
                        RoundedPrimaryButton(
                            title: MyStrings.register, voidCallback: () {}),
                        20.h.heightBox,
                        MyStrings.haveAccount.richText
                            .size(14)
                            .color(MyColors.primaryColor)
                            .withTextSpanChildren([
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => AutoRouter.of(context)
                                    .push(const LoginRoute()),
                              text: MyStrings.login,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700))
                        ]).makeCentered(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
