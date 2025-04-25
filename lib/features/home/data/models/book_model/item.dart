import 'package:bookly_app_clean_arc/features/home/domain/entities/book_entity/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'volume_info.dart';

class Item extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  }) : super(
          image: volumeInfo!.imageLinks?.thumbnail ?? '',
          autherName: volumeInfo.authors?.first ?? 'no name',
          title: volumeInfo.title ?? '',
          price: 0,
          rating: volumeInfo.ratingsCount ?? 0,
          bookId: id ?? '',
          url: volumeInfo.previewLink ?? '',
        );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
      };
}
