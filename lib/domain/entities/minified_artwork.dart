import 'package:image_search/domain/entities/artwork.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minified_artwork.g.dart';

@JsonSerializable(
  createToJson: false,
)
class MinifiedArtwork {
  MinifiedArtwork({
    required this.id,
    required this.title,
    required this.imageId,
    required this.thumbnail,
  });

  final int id;
  final String title;
  @JsonKey(name: 'image_id')
  final String imageId;
  final Thumbnail thumbnail;

  factory MinifiedArtwork.fromJson(Map<String, dynamic> json) => _$MinifiedArtworkFromJson(json);
}
