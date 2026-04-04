import 'package:bookly/features/Home/domain/models/book_model.dart';
import 'package:equatable/equatable.dart';

import 'item_dto.dart';

class BooksDto extends Equatable {
  final String? kind;
  final int? totalItems;
  final List<ItemsDto>? items;

  const BooksDto({this.kind, this.totalItems, this.items});

  factory BooksDto.fromJson(Map<String, dynamic> json) => BooksDto(
        kind: json['kind'] as String?,
        totalItems: json['totalItems'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => ItemsDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [kind, totalItems, items];
  BooksModel todomain() {
    return BooksModel(
      totalItems: totalItems,
      items: items?.map((e) => e.todomain()).toList() ?? [],
    );
  }
}
