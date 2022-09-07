import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_search/domain/entities/artwork.dart';
import 'package:image_search/repository/artwork_repository.dart';

class ArtworkDetailsCubit extends Cubit<AsyncSnapshot<Artwork>> {
  ArtworkDetailsCubit(this.artworkId, {ArtworkRepository? repository})
      : repository = repository ?? ArtworkRepository(),
        super(const AsyncSnapshot.waiting()) {
    this.repository.getArtworkDetails(artworkId).then(
          (value) => emit(value.fold(
            (l) => AsyncSnapshot.withError(ConnectionState.done, l),
            (r) {
              _iiifURL = r.config.iiifURL;
              return AsyncSnapshot.withData(ConnectionState.active, r.data);
            },
          )),
        );
  }

  final int artworkId;
  final ArtworkRepository repository;
  late final String _iiifURL;

  String get imageURL => repository.imageURLBuilder(state.data!.imageId, _iiifURL);
}
