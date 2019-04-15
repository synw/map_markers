import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:speech_bubble/speech_bubble.dart';

class _BubbleMarkerState extends State<BubbleMarker> {
  _BubbleMarkerState(
      {this.widgetBuilder,
      @required this.bubbleContentWidgetBuilder,
      this.bubbleColor = Colors.green}) {
    widgetBuilder = widgetBuilder ?? (_) => Icon(Icons.location_on);
  }

  WidgetBuilder widgetBuilder;
  final Color bubbleColor;
  final WidgetBuilder bubbleContentWidgetBuilder;

  bool _isPoped = false;

  @override
  Widget build(BuildContext context) {
    Widget marker = GestureDetector(
        child: widgetBuilder(context),
        onTap: () => setState(() {
              _isPoped = !_isPoped;
            }));
    Widget w;
    !_isPoped
        ? w = marker
        : w = Column(
            children: <Widget>[
              GestureDetector(
                  child: SpeechBubble(
                child: bubbleContentWidgetBuilder(context),
                color: bubbleColor,
              )),
              marker
            ],
          );
    return w;
  }
}

class BubbleMarker extends StatefulWidget {
  BubbleMarker(
      {Key key,
      this.bubbleContentWidgetBuilder,
      this.widgetBuilder,
      this.bubbleColor})
      : super(key: key);

  final WidgetBuilder widgetBuilder;
  final WidgetBuilder bubbleContentWidgetBuilder;
  final Color bubbleColor;

  @override
  _BubbleMarkerState createState() => _BubbleMarkerState(
      bubbleContentWidgetBuilder: bubbleContentWidgetBuilder,
      widgetBuilder: widgetBuilder,
      bubbleColor: bubbleColor);
}
