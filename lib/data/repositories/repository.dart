import 'package:flutter_bloc_clean_app/data/repositories/auth_repo.dart';
import 'package:flutter_bloc_clean_app/data/repositories/home_repo.dart';
import 'package:flutter_bloc_clean_app/data/repositories/tag_repo.dart';

class Repository {
  Repository({required this.tagsRepo, required this.authRepo, required this.homeRepo});

  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
  final HomeRepo homeRepo;

}