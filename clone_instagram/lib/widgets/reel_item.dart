import 'package:clone_instagram/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReelItemWidget extends StatefulWidget {
  final String videoUrl;
  const ReelItemWidget(
      {super.key,
      this.videoUrl =
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'});

  @override
  State<ReelItemWidget> createState() => _ReelItemWidgetState();
}

class _ReelItemWidgetState extends State<ReelItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: VideoPlayerWidget(
            url: widget.videoUrl,
            isVideoProgressIndicator: true,
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'TuneOfCode',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.white54),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 300,
                child: RichText(
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  text: const TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Xem thêm',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Music Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '•',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      'Artist Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          right: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              const Text(
                '823k',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/comment.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 35,
                  ),
                ),
              ),
              const Text(
                '51',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/share.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 35,
                  ),
                ),
              ),
              const Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Image.asset(
                  'assets/images/content2.jpg',
                  height: 25,
                  width: 25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
