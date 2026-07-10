import 'package:flutter/material.dart';
import 'package:nephro_guard_bd/core/routes/app_router.dart';
import 'package:nephro_guard_bd/core/theme/app_theme.dart';



class NephroGuardApp extends StatelessWidget {
  const NephroGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'NephroGuard BD',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}