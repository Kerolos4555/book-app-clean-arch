import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String autherName;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final num rating;
  @HiveField(5)
  final String bookId;
  @HiveField(6)
  final String url;

  BookEntity({
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
    required this.bookId,
    required this.url,
  });
}
