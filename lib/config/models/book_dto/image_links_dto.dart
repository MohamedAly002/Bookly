import 'package:equatable/equatable.dart';

class ImageLinksDto extends Equatable {
  final String smallThumbnail;
  final String thumbnail;

  const ImageLinksDto({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinksDto.fromJson(Map<String, dynamic> json) => ImageLinksDto(
        smallThumbnail: json['smallThumbnail'] as String,
        thumbnail: json['thumbnail'] as String,
      );

  Map<String, dynamic> toJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
      };

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
