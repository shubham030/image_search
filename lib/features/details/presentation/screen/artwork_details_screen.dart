import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/domain/entities/artwork.dart';
import 'package:image_search/features/details/bloc/artwork_details_cubit.dart';
import 'package:image_search/features/details/presentation/screen/fullscreen_image.dart';
import 'package:image_search/misc/extensions.dart';

class ArtworkDetailsScreen extends StatefulWidget {
  const ArtworkDetailsScreen({
    required this.id,
    required this.title,
    Key? key,
  }) : super(key: key);

  final int id;
  final String title;

  static route(int id, String title) => MaterialPageRoute(
        builder: (context) => ArtworkDetailsScreen(
          id: id,
          title: title,
        ),
      );

  @override
  State<ArtworkDetailsScreen> createState() => _ArtworkDetailsScreenState();
}

class _ArtworkDetailsScreenState extends State<ArtworkDetailsScreen> {
  late final ArtworkDetailsCubit _cubit;

  @override
  void initState() {
    _cubit = ArtworkDetailsCubit(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<ArtworkDetailsCubit, AsyncSnapshot<Artwork>>(
        bloc: _cubit,
        builder: (context, snapshot) {
          return snapshot.when(data: (Artwork data) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: 280,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: _cubit.imageURL,
                              placeholder: (c, _) => Image.memory(data.thumbnail.toBase64),
                              fit: BoxFit.cover,
                              height: 280,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: const Icon(
                                Icons.fullscreen,
                              ),
                              onPressed: () => Navigator.of(context).push(
                                FullScreenImage.route(_cubit.imageURL),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(data.artistDisplay),
                  ),
                ],
              ),
            );
          }, err: (Object err, _) {
            return Center(child: Text(err.toString()));
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          });
        },
      ),
    );
  }
}
