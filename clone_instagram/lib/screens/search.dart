import 'package:clone_instagram/widgets/bottom_bar.dart';
import 'package:clone_instagram/widgets/grid_gallery.dart';
import 'package:clone_instagram/widgets/search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        if (kDebugMode) {
          print("======> After clicking the Android Back Button");
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const SearchBarWidget(),
          backgroundColor: Colors.black,
        ),
        body: const GridGalleryWidget(),
        bottomNavigationBar: const BottomBarWidget(
          currentIndex: 1,
        ),
      ),
    );
  }
}
