import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean_app/data/models/message_model.dart';
import 'package:flutter_bloc_clean_app/data/utils/utils.dart';
import 'package:flutter_bloc_clean_app/presentation/routes/routes_import.gr.dart';
import 'package:meta/meta.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../data/repositories/repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Repository repository;
  ProfileCubit({required this.repository}) : super(ProfileInitial());

  userLogout(context) async {
    try {
      var data = await repository.authRepo.userLogout();
      if(data.message.isNotEmptyAndNotNull){
        AutoRouter.of(context).replace(const AuthRoute());
        Utils.clearAllData();
        VxToast.show(context, msg: data.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }

}




