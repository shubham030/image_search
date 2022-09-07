part of 'image_search_bloc.dart';

@immutable
abstract class ImageSearchEvent {}

class SearchImage extends ImageSearchEvent {
  SearchImage(this.query);
  final String query;
}

class ClearSearch extends ImageSearchEvent {}
