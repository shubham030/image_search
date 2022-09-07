import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({
    required this.image,
    Key? key,
  }) : super(key: key);

  final String image;

  static MaterialPageRoute route(String image) => MaterialPageRoute(
        builder: (context) => FullScreenImage(
          image: image,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(image),
      ),
    );
  }
}
