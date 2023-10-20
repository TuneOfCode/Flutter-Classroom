import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final String name;
  final String avatar;
  final bool isSeen;
  final bool isAdd;

  const Story(
      {super.key,
      required this.name,
      required this.avatar,
      this.isSeen = false,
      this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
            ),
            borderRadius: BorderRadius.circular(50),
            gradient: isAdd || isSeen
                ? const LinearGradient(colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black
                  ])
                : const LinearGradient(colors: [
                    Colors.yellow,
                    Colors.red,
                    Colors.purple,
                    Colors.pink,
                  ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 40,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
        if (isAdd) ...[
          Positioned(
            top: 68,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Colors.black,
                ),
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          )
        ],
        Container(
          margin: const EdgeInsets.only(top: 100),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
