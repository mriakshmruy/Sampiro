import 'package:flutter/material.dart';
import 'package:sampiro/core/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _appRouter.config());
  }
}
