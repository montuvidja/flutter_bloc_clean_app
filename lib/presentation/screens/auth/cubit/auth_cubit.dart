import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/auth/login/login_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../data/repositories/repository.dart';
import '../../../../data/utils/utils.dart';
import '../../../routes/routes_import.gr.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Repository repository;

  AuthCubit({required this.repository}) : super(AuthInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final fromKey = GlobalKey<FormState>();


 userLogin(context) async {
    try {
      emit(LoginLoadingState());
      var data = await repository.authRepo.userLogin(emailController.text.trim(), passwordController.text.trim());

      AutoRouter.of(context).replace(const DashBoardRoute());
      Utils.saveToken(data.accessToken.toString());

      emit(LoginSuccessState(data));
    } catch (e) {
      VxToast.show(context, msg: e.toString());
      print(e);
      emit(LoginErrorState(e.toString()));
    }
  }
  userRegister(context) async {
    try {
      emit(LoginLoadingState());
      var data = await repository.authRepo.userRegister(nameController.text.trim(),emailController.text.trim(), passwordController.text.trim());

      AutoRouter.of(context).replace(const DashBoardRoute());
      Utils.saveToken(data.accessToken.toString());

      emit(LoginSuccessState(data));
    } catch (e) {
      VxToast.show(context, msg: e.toString());
      print(e);
      emit(LoginErrorState(e.toString()));
    }
  }
}
