part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = AuthCubit(repository: context.read<Repository>());
    super.initState();
  }

  @override
  void dispose() {
    authCubit.emailController.dispose();
    authCubit.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        resizeToAvoidBottomInset: true,
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
              Form(
                key: authCubit.fromKey,
                child: Container(
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
                        MyStrings.login.text
                            .size(18)
                            .fontWeight(FontWeight.w700)
                            .makeCentered(),
                        50.h.heightBox,
                        MyStrings.email.text
                            .size(14)
                            .fontWeight(FontWeight.w500)
                            .make(),
                        8.h.heightBox,
                        RoundedCornerTextField(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: MyColors.primaryColor,
                          ),
                          isPassword: false,
                          obscureText: false,
                          controller: authCubit.emailController,
                          validator: (email) {
                            if (email!.trim().isEmpty) {
                              return MyStrings.enterEmail;
                            } else if (!email.trim().isValidEmail) {
                              return MyStrings.enterValidEmail;
                            }
                            return null;
                          },
                        ),
                        15.h.heightBox,
                        MyStrings.password.text
                            .size(14)
                            .fontWeight(FontWeight.w500)
                            .make(),
                        8.h.heightBox,
                        RoundedCornerTextField(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: MyColors.primaryColor,
                          ),
                          isPassword: true,
                          obscureText: true,
                          controller: authCubit.passwordController,
                          validator: (password) {
                            if (password!.trim().isEmpty) {
                              return MyStrings.enterPassword;
                            } else if (password.trim().length < 5) {
                              return MyStrings.enterValidPassword;
                            }

                            return null;
                          },
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
                            MyStrings.forgotPassword.text
                                .size(12)
                                .align(TextAlign.left)
                                .make()
                          ],
                        ),
                        30.h.heightBox,
                        BlocBuilder<AuthCubit, AuthState>(
                          bloc: authCubit,
                          builder: (context, state) {
                            return RoundedPrimaryButton(
                              title: MyStrings.login,
                              voidCallback: () {
                                if (authCubit.fromKey.currentState!
                                    .validate()) {
                                  authCubit.userLogin(context);
                                }
                              },
                              isLoading: state is LoginLoadingState,
                            );
                          },
                        ),
                        20.h.heightBox,
                        MyStrings.notHaveAccount.richText
                            .size(14)
                            .color(MyColors.primaryColor)
                            .withTextSpanChildren([
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => AutoRouter.of(context)
                                    .replace(const RegisterRoute()),
                              text: MyStrings.signUp,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700))
                        ]).makeCentered(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
