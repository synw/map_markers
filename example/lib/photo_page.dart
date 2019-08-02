import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  PhotoPage({Key key, this.tag}) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: tag,
          child: Image.asset(
            "assets/photo.jpeg",
            fit: BoxFit.fitWidth,
          )),
    );
  }
}
