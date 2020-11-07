import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var index = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tab Bar With Swipe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DefaultTabController(
          // The number of tabs / content sections to display.
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                title: Center(child: Text('APIs for images')),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.shuffle)),
                    Tab(icon: Icon(Icons.pets)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails dragEndDetails) => {
                      _swipeNavigation(context, dragEndDetails),
                    },
                    child: Stack(
                      children: <Widget>[
                        Center(child: CircularProgressIndicator()),
                        Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                'https://www.fillmurray.com/200/${index + 300}',
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails dragEndDetails) => {
                      _swipeNavigation(context, dragEndDetails),
                    },
                    child: Stack(
                      children: <Widget>[
                        Center(child: CircularProgressIndicator()),
                        Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                'https://picsum.photos/250/300?random=$index',
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails dragEndDetails) => {
                      _swipeNavigation(context, dragEndDetails),
                    },
                    child: Stack(
                      children: <Widget>[
                        Center(child: CircularProgressIndicator()),
                        Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: 'https://placekitten.com/200/${index + 300}',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  ///Navigation
  void _swipeNavigation(BuildContext context, DragEndDetails details) {
    if (details.primaryVelocity.compareTo(0) == -1) {
      //left to right
      log("left to right $index");

      setState(() {
        index += 1;
      });
    } else {
      log("right to left $index");
      setState(() {
        index -= 1;
      });
    }
  }
}
