import 'package:equatable/equatable.dart';

class SearchInfoDto extends Equatable {
  final String? textSnippet;

  const SearchInfoDto({this.textSnippet});

  factory SearchInfoDto.fromJson(Map<String, dynamic> json) => SearchInfoDto(
        textSnippet: json['textSnippet'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'textSnippet': textSnippet,
      };

  @override
  List<Object?> get props => [textSnippet];
}
