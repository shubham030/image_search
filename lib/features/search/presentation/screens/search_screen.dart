import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/features/details/presentation/screen/artwork_details_screen.dart';
import 'package:image_search/features/search/bloc/image_search_bloc.dart';
import 'package:image_search/features/search/presentation/widgets/artwork_item_widget.dart';
import 'package:image_search/repository/artwork_repository.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final ImageSearchBloc _bloc;
  Timer? _debounce;
  late final ScrollController _scrollController;
  String query = '';

  @override
  void initState() {
    _bloc = ImageSearchBloc(repository: ArtworkRepository());
    _scrollController = ScrollController()..addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _debounce?.cancel();
    _scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _bloc.add(SearchImage(query));
    });
  }

  void onScroll() {
    if (_scrollController.offset == _scrollController.position.maxScrollExtent &&
        !_bloc.isFetching) {
      _bloc
        ..isFetching = true
        ..add(SearchImage(query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Material(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search Artworks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    query = value;
                    if (value.isNotEmpty) {
                      _onSearchChanged();
                    } else {
                      _bloc.add(ClearSearch());
                    }
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<ImageSearchBloc, ImageSearchState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    if (state is ImageSearchLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ImageSearchSuccessState) {
                      return ListView.separated(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: state.artworks.length,
                        itemBuilder: (context, index) {
                          final artwork = state.artworks[index];
                          return ArtworkItemWidget(
                            artwork: artwork,
                            onTap: () {
                              Navigator.of(context).push(
                                ArtworkDetailsScreen.route(artwork.id, artwork.title),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, _) {
                          return const SizedBox(height: 8);
                        },
                      );
                    }
                    if (state is ImageSearchErrorState) {
                      return Text(state.message);
                    }
                    return const Center(
                      child: Text('Search for an image'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
