import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(createToJson: false)
class Pagination {
  Pagination({
    required this.total,
    required this.limit,
    required this.offset,
    required this.totalPages,
    required this.currentPage,
  });

  final int total;
  final int limit;
  final int offset;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'current_page')
  final int currentPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

@JsonSerializable(createToJson: false)
class Config {
  Config({
    required this.iiifURL,
  });
  @JsonKey(name: 'iiif_url')
  final String iiifURL;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
