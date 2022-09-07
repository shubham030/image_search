// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minified_artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinifiedArtwork _$MinifiedArtworkFromJson(Map<String, dynamic> json) =>
    MinifiedArtwork(
      id: json['id'] as int,
      title: json['title'] as String,
      imageId: json['image_id'] as String,
      thumbnail: Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );
