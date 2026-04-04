import 'package:bookly/features/Home/domain/models/items_model.dart';
import 'package:equatable/equatable.dart';

import 'access_info_dto.dart';
import 'sale_info_dto.dart';
import 'search_info_dto.dart';
import 'volume_info_dto.dart';

class ItemsDto extends Equatable {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfoDto volumeInfo;
  final SaleInfoDto? saleInfo;
  final AccessInfoDto? accessInfo;
  final SearchInfoDto? searchInfo;

  const ItemsDto({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory ItemsDto.fromJson(Map<String, dynamic> json) => ItemsDto(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo:
            VolumeInfoDto.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfoDto.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfoDto.fromJson(
                json['accessInfo'] as Map<String, dynamic>),
        searchInfo: json['searchInfo'] == null
            ? null
            : SearchInfoDto.fromJson(
                json['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
        'searchInfo': searchInfo?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      kind,
      id,
      etag,
      selfLink,
      volumeInfo,
      saleInfo,
      accessInfo,
      searchInfo,
    ];
  }

  ItemsModel todomain() => ItemsModel(
        volumeInfo: volumeInfo.todomain(),
      );
}
