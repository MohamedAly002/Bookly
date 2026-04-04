import 'package:equatable/equatable.dart';

class EpubDto extends Equatable {
  final bool? isAvailable;
  final String? downloadLink;

  const EpubDto({this.isAvailable, this.downloadLink});

  factory EpubDto.fromJson(Map<String, dynamic> json) => EpubDto(
        isAvailable: json['isAvailable'] as bool?,
        downloadLink: json['downloadLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'downloadLink': downloadLink,
      };

  @override
  List<Object?> get props => [isAvailable, downloadLink];
}
