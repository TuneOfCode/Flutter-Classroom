import 'package:clone_instagram/data/posts.dart';
import 'package:clone_instagram/data/stories.dart';
import 'package:clone_instagram/widgets/bottom_bar.dart';
import 'package:clone_instagram/widgets/post.dart';
import 'package:clone_instagram/widgets/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupMenuItemAppBarData {
  final String title;
  final IconData icon;
  const PopupMenuItemAppBarData({required this.title, required this.icon});
}

List<PopupMenuEntry> renderPopupMenuItemAppBar(BuildContext context) {
  List popupMenuItemData = [
    const PopupMenuItemAppBarData(
        title: 'Đang theo dõi', icon: Icons.group_outlined),
    const PopupMenuItemAppBarData(
        title: 'Yêu thích', icon: Icons.star_border_outlined),
  ];
  return [
    for (var item in popupMenuItemData)
      PopupMenuItem(
        padding: EdgeInsets.zero,
        child: ListTile(
          title: Text(item.title),
          textColor: Colors.white,
          trailing: Icon(item.icon),
          iconColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        ),
      ),
  ];
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              color: Colors.white,
            ),
            PopupMenuButton(
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              color: const Color.fromARGB(221, 37, 37, 37).withOpacity(1),
              offset: const Offset(-100, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              itemBuilder: renderPopupMenuItemAppBar,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/fbmessenger.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Story(
                      name: stories[index].name,
                      avatar: stories[index].avatar,
                      isSeen: stories[index].isSeen,
                      isAdd: stories[index].isAdd,
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 0.1,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Post(
                    authorAvatar: posts[index].authorAvatar,
                    authorName: posts[index].authorName,
                    place: posts[index].place,
                    isVerify: posts[index].isVerify,
                    assets: posts[index].assets,
                    description: posts[index].description,
                    likeCount: posts[index].likeCount,
                    commentCount: posts[index].commentCount,
                    timeAgo: posts[index].timeAgo,
                    commenterAvatar: posts[index].commenterAvatar,
                    isTranslate: posts[index].isTranslate,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBarWidget(
        currentIndex: 0,
      ),
    );
  }
}
