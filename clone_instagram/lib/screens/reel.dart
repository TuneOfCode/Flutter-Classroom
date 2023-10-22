import 'package:clone_instagram/widgets/bottom_bar.dart';
import 'package:clone_instagram/widgets/reel_item.dart';
import 'package:flutter/material.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Reels',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        scrollBehavior: const ScrollBehavior(),
        scrollDirection: Axis.vertical,
        children: const [
          ReelItemWidget(
            videoUrl: 'assets/videos/vo2.mp4',
          ),
          ReelItemWidget(),
        ],
      ),
      bottomNavigationBar: const BottomBarWidget(currentIndex: 3),
    );
  }
}
