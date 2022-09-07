// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      total: json['total'] as int,
      limit: json['limit'] as int,
      offset: json['offset'] as int,
      totalPages: json['total_pages'] as int,
      currentPage: json['current_page'] as int,
    );

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      iiifURL: json['iiif_url'] as String,
    );
