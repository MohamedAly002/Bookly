import 'package:equatable/equatable.dart';

class PdfDto extends Equatable {
  final bool? isAvailable;

  const PdfDto({this.isAvailable});

  factory PdfDto.fromJson(Map<String, dynamic> json) => PdfDto(
        isAvailable: json['isAvailable'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
      };

  @override
  List<Object?> get props => [isAvailable];
}
