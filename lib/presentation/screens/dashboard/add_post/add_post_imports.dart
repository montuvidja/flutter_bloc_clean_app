import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_app/data/core/constants/my_colors.dart';
import 'package:flutter_bloc_clean_app/data/core/constants/my_strings.dart';
import 'package:flutter_bloc_clean_app/data/repositories/repository.dart';
import 'package:flutter_bloc_clean_app/presentation/common_widgets/common_widget_imports.dart';
import 'package:flutter_bloc_clean_app/presentation/routes/routes_import.gr.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/add_post/cubit/add_post_cubit.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../category/category_model.dart';
import '../tags/tags_imports.dart';
part 'add_post.dart';