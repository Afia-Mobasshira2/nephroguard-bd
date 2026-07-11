import 'package:go_router/go_router.dart';

import 'package:nephro_guard_bd/features/auth/login_screen.dart';
import 'package:nephro_guard_bd/features/dashboard/dashboard_screen.dart';
import 'package:nephro_guard_bd/features/history/history_screen.dart';
import 'package:nephro_guard_bd/features/patient/patient_form_screen.dart';
import 'package:nephro_guard_bd/features/prediction/prediction_screen.dart';
import 'package:nephro_guard_bd/features/profile/profile_screen.dart';
import 'package:nephro_guard_bd/features/splash/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: "/",

    routes: [

      // Splash Screen
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),

      // Login Screen
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginScreen(),
      ),

      // Dashboard
      GoRoute(
        path: "/dashboard",
        builder: (context, state) => const DashboardScreen(),
      ),

      // Patient Information Form
      GoRoute(
        path: "/patient",
        builder: (context, state) => const PatientFormScreen(),
      ),

      // Prediction Result
     GoRoute(
      path: "/prediction",
      builder: (context, state) {
      final result = state.extra as Map<String, dynamic>;

      return PredictionScreen(result: result);
  },
),

      // History
      GoRoute(
        path: "/history",
        builder: (context, state) => const HistoryScreen(),
      ),

      // Profile
      GoRoute(
        path: "/profile",
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}