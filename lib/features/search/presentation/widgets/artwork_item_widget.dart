import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/domain/entities/minified_artwork.dart';
import 'package:image_search/features/search/bloc/image_search_bloc.dart';

class ArtworkItemWidget extends StatelessWidget {
  const ArtworkItemWidget({
    required this.artwork,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final MinifiedArtwork artwork;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ImageSearchBloc>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: bloc.imageURLBuilder(artwork),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 260,
                placeholder: (context, url) {
                  return Image.memory(
                    artwork.thumbnail.toBase64,
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      top: BorderSide(color: Colors.white),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    artwork.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
