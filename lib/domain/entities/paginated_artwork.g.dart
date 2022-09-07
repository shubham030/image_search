// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedMinifiedArtwork _$PaginatedMinifiedArtworkFromJson(
        Map<String, dynamic> json) =>
    PaginatedMinifiedArtwork(
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => MinifiedArtwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      config: Config.fromJson(json['config'] as Map<String, dynamic>),
    );
