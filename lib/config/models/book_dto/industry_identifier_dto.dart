import 'package:equatable/equatable.dart';

class IndustryIdentifierDto extends Equatable {
  final String? type;
  final String? identifier;

  const IndustryIdentifierDto({this.type, this.identifier});

  factory IndustryIdentifierDto.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifierDto(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'identifier': identifier,
      };

  @override
  List<Object?> get props => [type, identifier];
}
