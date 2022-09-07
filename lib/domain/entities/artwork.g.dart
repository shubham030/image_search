// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artwork _$ArtworkFromJson(Map<String, dynamic> json) => Artwork(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnail: Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      artistDisplay: json['artist_display'] as String,
      imageId: json['image_id'] as String,
    );

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      altText: json['alt_text'] as String,
      lqip: json['lqip'] as String,
    );
