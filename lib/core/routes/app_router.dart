import 'package:go_router/go_router.dart';
import 'package:nephro_guard_bd/features/auth/login_screen.dart';
import 'package:nephro_guard_bd/features/dashboard/dashboard_screen.dart';
import 'package:nephro_guard_bd/features/history/history_screen.dart';
import 'package:nephro_guard_bd/features/prediction/prediction_screen.dart';
import 'package:nephro_guard_bd/features/profile/profile_screen.dart';
import 'package:nephro_guard_bd/features/splash/splash_screen.dart';



class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: "/",

    routes: [
      GoRoute(
        path: "/",
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: "/login",
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: "/dashboard",
        builder: (_, __) => const DashboardScreen(),
      ),
      GoRoute(
        path: "/patient",
        builder: (_, __) => const DashboardScreen(),
      ),
      GoRoute(
        path: "/prediction",
        builder: (_, __) => const PredictionScreen(),
      ),
      GoRoute(
        path: "/history",
        builder: (_, __) => const HistoryScreen(),
      ),
      GoRoute(
        path: "/profile",
        builder: (_, __) => const ProfileScreen(),
      ),
    ],
  );
}