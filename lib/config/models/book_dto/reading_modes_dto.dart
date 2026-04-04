import 'package:equatable/equatable.dart';

class ReadingModesDto extends Equatable {
  final bool? text;
  final bool? image;

  const ReadingModesDto({this.text, this.image});

  factory ReadingModesDto.fromJson(Map<String, dynamic> json) =>
      ReadingModesDto(
        text: json['text'] as bool?,
        image: json['image'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'image': image,
      };

  @override
  List<Object?> get props => [text, image];
}
