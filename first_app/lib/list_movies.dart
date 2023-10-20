import 'package:flutter/material.dart';

class MyListMovies extends StatelessWidget {
  const MyListMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Movies'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  child: const Image(
                    image: AssetImage(
                      'assets/images/movie1.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  child: const Image(
                    image: AssetImage(
                      'assets/images/movie1.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  child: const Image(
                    image: AssetImage(
                      'assets/images/movie1.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  child: const Image(
                    image: AssetImage(
                      'assets/images/movie1.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  child: const Image(
                    image: AssetImage(
                      'assets/images/movie1.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
