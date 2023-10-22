import 'package:clone_instagram/screens/home.dart';
import 'package:clone_instagram/screens/reel.dart';
import 'package:clone_instagram/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarWidget extends StatefulWidget {
  final int currentIndex;
  const BottomBarWidget({super.key, required this.currentIndex});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              size: 35,
              color: _currentIndex == 0 ? Colors.blue : Colors.white,
            ),
            onPressed: () => {
              setState(() {
                _currentIndex = 0;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HomeScreen()));
              })
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 35,
              color: _currentIndex == 1 ? Colors.blue : Colors.white,
            ),
            onPressed: () => {
              setState(() {
                _currentIndex = 1;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SearchScreen()));
              })
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_box_outlined,
              size: 35,
              color: _currentIndex == 2 ? Colors.blue : Colors.white,
            ),
            onPressed: () => {
              setState(() {
                _currentIndex = 2;
              })
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/reels.svg',
              colorFilter: ColorFilter.mode(
                  _currentIndex == 3 ? Colors.blue : Colors.white,
                  BlendMode.srcIn),
              width: 35,
              height: 35,
            ),
            onPressed: () => {
              setState(() {
                _currentIndex = 3;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const ReelScreen()));
              })
            },
          ),
          IconButton(
            icon: Container(
              decoration: _currentIndex == 4
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
                _currentIndex = 4;
              })
            },
          ),
        ],
      ),
    );
  }
}
