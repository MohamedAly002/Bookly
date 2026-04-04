import 'package:equatable/equatable.dart';

class PanelizationSummaryDto extends Equatable {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  const PanelizationSummaryDto({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummaryDto.fromJson(Map<String, dynamic> json) {
    return PanelizationSummaryDto(
      containsEpubBubbles: json['containsEpubBubbles'] as bool?,
      containsImageBubbles: json['containsImageBubbles'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'containsEpubBubbles': containsEpubBubbles,
        'containsImageBubbles': containsImageBubbles,
      };

  @override
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}
