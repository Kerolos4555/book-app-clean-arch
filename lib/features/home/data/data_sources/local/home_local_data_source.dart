import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  List<BookEntity> fetchNewestBooks({
    int pageNumber = 0,
  });
}
