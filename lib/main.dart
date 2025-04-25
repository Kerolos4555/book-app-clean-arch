import 'package:bookly_app_clean_arc/core/functions/service_locator.dart';
import 'package:bookly_app_clean_arc/core/utils/bloc_observer.dart';
import 'package:bookly_app_clean_arc/features/home/data/repositories/home_repo/home_repo_impl.dart';
import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';
import 'package:bookly_app_clean_arc/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean_arc/features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/feature_books_cubit/fearture_books_cubit.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_clean_arc/routes/app_router.dart';
import 'package:bookly_app_clean_arc/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(featuredBox);
  await Hive.openBox<BookEntity>(newestBox);
  Bloc.observer = MyBlocObserver();
  setServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            featuredBooksUseCase: FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            newestBooksUseCase: FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
