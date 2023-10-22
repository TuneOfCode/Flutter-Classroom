import 'package:clone_instagram/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridGalleryWidget extends StatefulWidget {
  const GridGalleryWidget({super.key});

  @override
  State<GridGalleryWidget> createState() => _GridGalleryWidgetState();
}

class _GridGalleryWidgetState extends State<GridGalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      childAspectRatio: 1 / 2,
      children: List.generate(100, (index) {
        return InkWell(
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (index != 2) ...[
                Image.asset(
                  'assets/images/content${index % 10}.jpg',
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 5,
                  right: 5,
                  child: Icon(Icons.picture_in_picture_alt),
                ),
              ] else ...[
                const GridTile(
                  child: VideoPlayerWidget(
                    url: 'assets/videos/vo2.mp4',
                  ),
                ),
                Positioned(
                  top: -6,
                  right: -8,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/reels.svg',
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: 25,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ],
          ),
          onTap: () {},
        );
      }),
    );
  }
}
