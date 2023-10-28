import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_model.dart';
import 'package:meta/meta.dart';

import '../../../../../data/repositories/repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository repository;
  HomeCubit({required this.repository}) : super(HomeInitial());

  getHomePosts() async {
    try {
      print("====== Home Post ======");
      emit(HomeLoadingState());
      var data = await repository.homeRepo.getHomePost();
      emit(HomeLoadedState(data));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
      print(e);
    }
  }

}
