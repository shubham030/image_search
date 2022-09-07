import 'package:flutter/material.dart';
import 'package:image_search/features/search/presentation/screens/search_screen.dart';
import 'package:image_search/misc/constants.dart';

class ImageSearchApp extends StatelessWidget {
  const ImageSearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
      ),
      home: const SearchScreen(),
    );
  }
}
