import 'package:image_search/domain/entities/artwork.dart';
import 'package:image_search/domain/entities/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artwork_details.g.dart';

@JsonSerializable(createToJson: false)
class ArtworkDetails {
  ArtworkDetails({
    required this.config,
    required this.data,
  });

  final Config config;
  final Artwork data;

  factory ArtworkDetails.fromJson(Map<String, dynamic> json) => _$ArtworkDetailsFromJson(json);
}
