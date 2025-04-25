import 'package:bookly_app_clean_arc/core/api/api_service.dart';
import 'package:bookly_app_clean_arc/core/functions/save_data.dart';
import 'package:bookly_app_clean_arc/core/utils/constants.dart';
import 'package:bookly_app_clean_arc/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bookly_app_clean_arc/features/home/data/models/book_model/item.dart';
import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';

class HomeRemoteDataSourceImple extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImple({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);

    saveDataToLocal(books, featuredBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);

    saveDataToLocal(books, newestBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var map in data['items']) {
      books.add(Item.fromJson(map));
    }
    return books;
  }
}
