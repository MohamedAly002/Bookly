import 'package:bookly/features/Home/domain/models/books_details.dart';
import 'package:equatable/equatable.dart';

import 'image_links_dto.dart';
import 'industry_identifier_dto.dart';
import 'panelization_summary_dto.dart';
import 'reading_modes_dto.dart';

class VolumeInfoDto extends Equatable {
  final String? title;
  final List<String>? authors;
  final double? averageRating;
  final int? ratingsCount;
  final String? publishedDate;
  final List<IndustryIdentifierDto>? industryIdentifiers;
  final ReadingModesDto? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummaryDto? panelizationSummary;
  final ImageLinksDto? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const VolumeInfoDto({
    this.title,
    this.authors,
    this.averageRating,
    this.ratingsCount,
    this.publishedDate,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    required this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfoDto.fromJson(Map<String, dynamic> json) => VolumeInfoDto(
        title: json['title'] as String?,
        authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
        publishedDate: json['publishedDate'] as String?,
        industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) =>
                IndustryIdentifierDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        readingModes: json['readingModes'] == null
            ? null
            : ReadingModesDto.fromJson(
                json['readingModes'] as Map<String, dynamic>),
        pageCount: json['pageCount'] as int?,
        printType: json['printType'] as String?,
        categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
        maturityRating: json['maturityRating'] as String?,
        allowAnonLogging: json['allowAnonLogging'] as bool?,
        contentVersion: json['contentVersion'] as String?,
        panelizationSummary: json['panelizationSummary'] == null
            ? null
            : PanelizationSummaryDto.fromJson(
                json['panelizationSummary'] as Map<String, dynamic>),
        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinksDto.fromJson(
                json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] as String?,
        previewLink: json['previewLink'] as String?,
        infoLink: json['infoLink'] as String?,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
        averageRating: json['averageRating']?.toDouble(),
        ratingsCount: json['ratingsCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publishedDate': publishedDate,
        'industryIdentifiers':
            industryIdentifiers?.map((e) => e.toJson()).toList(),
        'readingModes': readingModes?.toJson(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'panelizationSummary': panelizationSummary?.toJson(),
        'imageLinks': imageLinks?.toJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
      };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publishedDate,
      industryIdentifiers,
      readingModes,
      pageCount,
      printType,
      categories,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
  BooksDetails todomain(){
    return BooksDetails(
      authors: authors??['unknown'],
      title: title??'Unknown Title',
      imageLink:imageLinks?.thumbnail??'',
      previewLink:previewLink??'',
      averageRating:averageRating??0.0,
      ratingsCount: ratingsCount??0,
      categories: categories??[],
    );
  }
}
