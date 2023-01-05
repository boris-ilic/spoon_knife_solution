import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spoon_knife_solution/models/github_repository_model.dart';
import 'package:spoon_knife_solution/screens/detailed_screen.dart';
import 'package:spoon_knife_solution/screens/main_screen.dart';

part 'router.gr.dart';

@MaterialAutoRouter(   
  replaceInRouteName: 'Route,Page',      
  routes: <AutoRoute>[
    AutoRoute(
      page: MainRoute,
      initial: true,
    ),
    AutoRoute(
      page: DetailedRoute,
      
    )
  ]     
)
class $AppRouter extends _$$AppRouter {}              
