import 'package:equatable/equatable.dart';

class SaleInfoDto extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final String? buyLink;

  const SaleInfoDto({
    this.country,
    this.saleability,
    this.isEbook,
    this.buyLink,
  });

  factory SaleInfoDto.fromJson(Map<String, dynamic> json) => SaleInfoDto(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        isEbook: json['isEbook'] as bool?,
        buyLink: json['buyLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
        'buyLink': buyLink,
      };

  @override
  List<Object?> get props => [country, saleability, isEbook, buyLink];
}
