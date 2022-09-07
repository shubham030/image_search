part of 'image_search_bloc.dart';

@immutable
abstract class ImageSearchState extends Equatable {}

class ImageSearchInitial extends ImageSearchState {
  @override
  List<Object?> get props => [];
}

class ImageSearchLoadingState extends ImageSearchState {
  @override
  List<Object?> get props => [];
}

class ImageSearchErrorState extends ImageSearchState {
  ImageSearchErrorState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class ImageSearchSuccessState extends ImageSearchState {
  ImageSearchSuccessState(this.artworks);
  final List<MinifiedArtwork> artworks;

  @override
  List<Object?> get props => [artworks];
}
