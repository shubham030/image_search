import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'artwork.g.dart';

@JsonSerializable(createToJson: false)
class Artwork {
  Artwork({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.artistDisplay,
    required this.imageId,
  });
  final int id;
  final String title;
  final Thumbnail thumbnail;
  @JsonKey(name: 'artist_display')
  final String artistDisplay;
  @JsonKey(name: 'image_id')
  final String imageId;

  factory Artwork.fromJson(Map<String, dynamic> json) => _$ArtworkFromJson(json);
}

@JsonSerializable(
  createToJson: false,
)
class Thumbnail {
  Thumbnail({
    required this.altText,
    required this.lqip,
  });

  @JsonKey(name: 'alt_text')
  final String altText;
  final String lqip;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);

  Uint8List get toBase64 => base64Decode(lqip.split(',').last);
}
