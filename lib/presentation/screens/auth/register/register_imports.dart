import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_app/data/core/constants/my_strings.dart';
import 'package:flutter_bloc_clean_app/data/repositories/repository.dart';
import 'package:flutter_bloc_clean_app/data/utils/validations.dart';
import 'package:flutter_bloc_clean_app/presentation/routes/routes_import.gr.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../data/core/constants/my_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common_widgets/common_widget_imports.dart';

part 'register.dart';