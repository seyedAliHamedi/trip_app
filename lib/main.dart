// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trip_app/animation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: [
        maskCard(
            page: 1,
            image: 'one.jpg',
            title: 'Yosemite National Park',
            description:
                'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.'),
        maskCard(
            page: 2,
            image: 'two.jpg',
            title: 'Golden Gate Bridge',
            description:
                'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.'),
        maskCard(
            page: 3,
            image: 'three.jpg',
            title: 'Sedona',
            description:
                "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."),
        maskCard(
            page: 4,
            image: 'four.jpg',
            title: 'Savannah',
            description:
                "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
      ],
    ));
  }
}

Widget maskCard({image, title, description, page}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/$image'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(.1),
              Colors.black.withOpacity(.9),
            ]),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fade(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$page',
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text('/4',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
              ],
            )),
            Spacer(),
            Fade(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            Fade(
                child: Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const Icon(Icons.star, color: Colors.yellow),
                const Icon(Icons.star, color: Colors.yellow),
                const Icon(Icons.star, color: Colors.yellow),
                const Icon(Icons.star, color: Colors.grey),
                const Text(
                  '4.0',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '(2300)',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                )
              ],
            )),
            const SizedBox(height: 20.0),
            Fade(
              child: Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: Text(
                  description,
                  style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      letterSpacing: 1.1,
                      height: 1.9,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Fade(
                child: Text(
              'Read more',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 21.0),
            ))
          ],
        ),
      ),
    ),
  );
}
