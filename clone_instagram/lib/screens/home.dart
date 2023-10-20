import 'package:clone_instagram/data/posts.dart';
import 'package:clone_instagram/data/stories.dart';
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                size: 35,
                color: currentIndex == 0 ? Colors.blue : Colors.white,
              ),
              onPressed: () => {
                setState(() {
                  currentIndex = 0;
                })
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: 35,
                color: currentIndex == 1 ? Colors.blue : Colors.white,
              ),
              onPressed: () => {
                setState(() {
                  currentIndex = 1;
                })
              },
            ),
            IconButton(
              icon: Icon(
                Icons.add_box_outlined,
                size: 35,
                color: currentIndex == 2 ? Colors.blue : Colors.white,
              ),
              onPressed: () => {
                setState(() {
                  currentIndex = 2;
                })
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/reels.svg',
                colorFilter: ColorFilter.mode(
                    currentIndex == 3 ? Colors.blue : Colors.white,
                    BlendMode.srcIn),
                width: 35,
                height: 35,
              ),
              onPressed: () => {
                setState(() {
                  currentIndex = 3;
                })
              },
            ),
            IconButton(
              icon: Container(
                decoration: currentIndex == 4
                    ? BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      )
                    : const BoxDecoration(),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  radius: 20,
                ),
              ),
              onPressed: () => {
                setState(() {
                  currentIndex = 4;
                })
              },
            ),
          ],
        ),
      ),
    );
  }
}
