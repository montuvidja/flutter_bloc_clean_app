import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_app/data/repositories/repository.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/category/cubit/category_cubit.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/tags/cubit/tags_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../data/core/constants/my_colors.dart';
import '../../../../../data/core/constants/my_strings.dart';
import '../../../../common_widgets/common_widget_imports.dart';
import '../category_model.dart';

part 'update_category.dart';