part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
                          MyStrings.register.text
                              .size(18)
                              .fontWeight(FontWeight.w700)
                              .makeCentered(),
                          50.h.heightBox,
                          MyStrings.name.text
                              .size(14)
                              .fontWeight(FontWeight.w500)
                              .make(),
                          8.h.heightBox,
                          RoundedCornerTextField(
                            prefixIcon: const Icon(
                              Icons.person_2_outlined,
                              color: MyColors.primaryColor,
                            ),
                            isPassword: false,
                            obscureText: false,
                            controller: authCubit.nameController,
                              validator: (name) {
                                if (name!.trim().isEmpty) {
                                  return MyStrings.enterName;
                                } else if (name.trim().length < 5) {
                                  return MyStrings.enterValidPassword;
                                }

                                return null;
                              }
                          ),
                          15.h.heightBox,
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
                          15.h.heightBox,
                          MyStrings.confirmPassword.text
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
                            controller: authCubit.confirmPasswordController,
                            validator: (confirmPassword){
                                  if(confirmPassword?.trim() != authCubit.passwordController.text.trim()){
                                    return "Confirm password is not match with password";
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
                            ],
                          ),
                          30.h.heightBox,
                          BlocBuilder<AuthCubit, AuthState>(
                            bloc: authCubit,
                            builder: (context, state) {
                              return RoundedPrimaryButton(
                                title: MyStrings.register,
                                voidCallback: () {
                                  if (authCubit.fromKey.currentState!
                                      .validate()) {
                                    authCubit.userRegister(context);
                                  }
                                },
                                isLoading: state is LoginLoadingState,
                              );
                            },
                          ),
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
