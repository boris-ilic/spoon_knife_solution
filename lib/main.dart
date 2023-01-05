import 'package:flutter/material.dart';
import 'package:spoon_knife_solution/colors.dart';
import 'package:spoon_knife_solution/routes/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = $AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: 'Spoon Knife',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Palette.primary),
      ),
    );
  }
}
