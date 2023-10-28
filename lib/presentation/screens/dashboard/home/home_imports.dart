import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_app/data/core/constants/my_strings.dart';
import 'package:flutter_bloc_clean_app/data/repositories/repository.dart';
import 'package:flutter_bloc_clean_app/presentation/routes/routes_import.gr.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/cubit/home_cubit.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_model.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_view_model.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../data/core/constants/my_colors.dart';
import '../../../../gen/assets.gen.dart';

part 'home.dart';
part 'home_detail.dart';