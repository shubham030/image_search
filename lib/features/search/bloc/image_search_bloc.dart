import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_search/domain/entities/minified_artwork.dart';
import 'package:image_search/repository/artwork_repository.dart';

part 'image_search_event.dart';
part 'image_search_state.dart';

class ImageSearchBloc extends Bloc<ImageSearchEvent, ImageSearchState> {
  ImageSearchBloc({required this.repository}) : super(ImageSearchInitial()) {
    on<SearchImage>(searchImage);
    on<ClearSearch>(clearSearch);
  }

  final ArtworkRepository repository;
  int _page = 1;
  late String _iiifURL;
  bool isFetching = false;

  void searchImage(SearchImage event, Emitter<ImageSearchState> emit) async {
    if (state is! ImageSearchSuccessState) {
      emit(ImageSearchLoadingState());
    }
    try {
      final response = await repository.fetchArtworks(page: _page, query: event.query);
      response.fold((l) => emit(ImageSearchErrorState(l)), (r) {
        _page++;
        _iiifURL = r.config.iiifURL;
        final data = <MinifiedArtwork>[];
        if (state is ImageSearchSuccessState) {
          data.addAll((state as ImageSearchSuccessState).artworks);
        }
        emit(ImageSearchSuccessState([...data, ...r.data]));
      });
    } catch (e) {
      emit(ImageSearchErrorState(e.toString()));
    }
  }

  void clearSearch(ClearSearch event, Emitter<ImageSearchState> emit) {
    _page = 1;
    emit(ImageSearchInitial());
  }

  String imageURLBuilder(MinifiedArtwork artwork) =>
      repository.imageURLBuilder(artwork.imageId, _iiifURL);
}
