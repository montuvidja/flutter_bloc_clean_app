import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_app/presentation/routes/routes_import.gr.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/tags/cubit/tags_cubit.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../data/core/constants/my_colors.dart';
import '../../../../data/core/constants/my_strings.dart';
import '../../../../data/repositories/repository.dart';
part 'tags.dart';
part 'tags_model.dart';