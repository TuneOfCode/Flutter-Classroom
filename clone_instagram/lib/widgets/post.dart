import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_instagram/constants/home.constant.dart';
import 'package:clone_instagram/widgets/post_modal_bottom_sheet.dart';
import 'package:clone_instagram/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Post extends StatefulWidget {
  final String authorAvatar;
  final String authorName;
  final String place;
  final bool isVerify;
  final List<String> assets;
  final String description;
  final int likeCount;
  final int commentCount;
  final String timeAgo;
  final String commenterAvatar;
  final bool isTranslate;
  final bool isLiked;

  const Post({
    super.key,
    required this.authorAvatar,
    required this.authorName,
    this.place = "",
    this.isVerify = true,
    required this.assets,
    required this.description,
    required this.likeCount,
    required this.commentCount,
    required this.timeAgo,
    required this.commenterAvatar,
    this.isTranslate = true,
    this.isLiked = false,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late int _currentSlideIndex;
  late bool _isLiked;
  late int _likeCount;
  late bool _isSeeMore;
  late bool _isHideShareAndLink;

  @override
  void initState() {
    super.initState();
    _currentSlideIndex = 0;
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    _isSeeMore = false;
    _isHideShareAndLink = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(colors: [
                    Colors.yellow,
                    Colors.red,
                    Colors.purple,
                    Colors.pink,
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(50),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.authorAvatar),
                      radius: 20,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            widget.authorName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (widget.isVerify) ...[
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue[900],
                          )
                        ],
                      ],
                    ),
                    Text(
                      widget.place,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
            onPressed: () {
              setState(() {
                _isHideShareAndLink = false;
              });
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return PostModalBottomSheetWidget(
                    isHideShareAndLink: _isHideShareAndLink,
                  );
                },
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Stack(
                children: [
                  if (widget.assets.length == 1) ...[
                    Image.asset(
                      widget.assets[0],
                      fit: BoxFit.cover,
                    ),
                  ] else ...[
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 333,
                        viewportFraction: 1,
                        aspectRatio: 2.0,
                        initialPage: _currentSlideIndex,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentSlideIndex = index;
                          });
                        },
                      ),
                      items: widget.assets.map(
                        (asset) {
                          if (asset.contains('mp4') ||
                              asset.contains('mov') ||
                              asset.contains('mp3')) {
                            return VideoPlayerWidget(
                              url: asset,
                              isVideoProgressIndicator: true,
                            );
                          }
                          return Image.asset(
                            asset,
                            fit: BoxFit.cover,
                          );
                        },
                      ).toList(),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '${_currentSlideIndex + 1}/${widget.assets.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              onDoubleTap: () {
                setState(() {
                  _isLiked = !_isLiked;
                  _likeCount += _isLiked ? 1 : -1;
                });
              },
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                    color: _isLiked ? Colors.red : Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                      _likeCount += _isLiked ? 1 : -1;
                    });
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/comment.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/share.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {},
                ),
                if (widget.assets.length > 1) ...[
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: widget.assets.map((asset) {
                        int index = widget.assets.indexOf(asset);
                        return Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentSlideIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                            ));
                      }).toList(),
                    ),
                  ),
                ],
                const Spacer(),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/bookmark.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 10),
              child: Text(
                "${_likeCount / 1000} lượt thích",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: RichText(
                textAlign: TextAlign.justify,
                overflow:
                    _isSeeMore ? TextOverflow.clip : TextOverflow.ellipsis,
                text: TextSpan(
                  text: widget.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (widget.description.length > ruleSeeMore) ...[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () => {
                    setState(() {
                      _isSeeMore = !_isSeeMore;
                    })
                  },
                  child: Text(
                    _isSeeMore ? 'Thu gọn' : 'Xem thêm',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: InkWell(
                onLongPress: () => {},
                child: Text(
                  'Xem tất cả ${widget.commentCount} bình luận',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.commenterAvatar),
                    radius: 20,
                    foregroundColor: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => {},
                      child: Text(
                        'Thêm bình luận...',
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Row(
                children: [
                  Text(
                    widget.timeAgo,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 14),
                  ),
                  if (widget.isTranslate) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8)),
                          child: const SizedBox(
                            width: 2,
                            height: 2,
                          )),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: const Text(
                        'Xem bản dịch',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
