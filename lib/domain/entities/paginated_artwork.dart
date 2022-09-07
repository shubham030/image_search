import 'package:image_search/domain/entities/minified_artwork.dart';
import 'package:image_search/domain/entities/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_artwork.g.dart';

@JsonSerializable(
  createToJson: false,
)
class PaginatedMinifiedArtwork {
  PaginatedMinifiedArtwork({
    required this.pagination,
    required this.data,
    required this.config,
  });

  final Pagination pagination;
  final List<MinifiedArtwork> data;
  final Config config;

  factory PaginatedMinifiedArtwork.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMinifiedArtworkFromJson(json);
}
