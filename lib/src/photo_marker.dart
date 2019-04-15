import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'types.dart';

class _PhotoMarkerState extends State<PhotoMarker> {
  _PhotoMarkerState(
      {@required this.name,
      @required this.imageAsset,
      @required this.routeBuilder,
      @required this.widgetBuilder})
      : assert(name != null),
        assert(imageAsset != null);

  final String imageAsset;
  final String name;
  final RouteBuilder routeBuilder;
  final WidgetBuilder widgetBuilder;

  bool _isPoped = false;

  Future<void> popImg(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 200));
    routeBuilder(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget w;
    _isPoped
        ? w = Hero(
            tag: name,
            child: Image.asset(imageAsset, width: 60.0, height: 45.0))
        : w = GestureDetector(
            child: widgetBuilder(context),
            onTap: () => setState(() {
                  _isPoped = true;
                  popImg(context).then((_) {
                    _isPoped = false;
                  });
                }));
    return w;
  }
}

class PhotoMarker extends StatefulWidget {
  PhotoMarker(
      {Key key,
      this.name,
      this.imageAsset,
      this.routeBuilder,
      this.widgetBuilder})
      : super(key: key);

  final String imageAsset;
  final String name;
  final RouteBuilder routeBuilder;
  final WidgetBuilder widgetBuilder;

  @override
  _PhotoMarkerState createState() => _PhotoMarkerState(
      name: name,
      imageAsset: imageAsset,
      routeBuilder: routeBuilder,
      widgetBuilder: widgetBuilder);
}
