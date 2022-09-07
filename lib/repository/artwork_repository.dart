import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/domain/entities/artwork_details.dart';
import 'package:image_search/domain/entities/paginated_artwork.dart';

class ArtworkRepository {
  final http.Client _client;

  static const scheme = 'https';
  static const host = 'api.artic.edu';
  // static const _baseURL = 'https://api.artic.edu/api/v1/artworks/';

  ArtworkRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<Either<String, PaginatedMinifiedArtwork>> fetchArtworks({
    required int page,
    required String query,
    int limit = 10,
  }) async {
    final result = await _client.get(
      Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/artworks/search',
        queryParameters: {
          'q': query,
          'page': page.toString(),
          'limit': limit.toString(),
          'fields': 'id,title,image_id,thumbnail',
        },
      ),
    );
    if (result.statusCode == 200) {
      return right(PaginatedMinifiedArtwork.fromJson(jsonDecode(result.body)));
    } else {
      throw left('Failed to load artworks');
    }
  }

  Future<Either<String, ArtworkDetails>> getArtworkDetails(int id) async {
    final result = await _client.get(
      Uri(
        scheme: scheme,
        host: host,
        path: '/api/v1/artworks/$id',
      ),
    );
    if (result.statusCode == 200) {
      return right(ArtworkDetails.fromJson(jsonDecode(result.body)));
    } else {
      return left('Failed to load artwork details');
    }
  }

  String imageURLBuilder(String imageId, String iiifURL) {
    return '$iiifURL/$imageId/full/843,/0/default.jpg';
  }
}
