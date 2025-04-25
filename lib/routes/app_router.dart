import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/views/home_view.dart';
import 'package:bookly_app_clean_arc/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/bookDetailsView',
        builder: (context, state) => BookDetailsView(
          book: state.extra as BookEntity,
        ),
      ),
    ],
  );
}
