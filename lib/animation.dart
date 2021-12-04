import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, offset }

class Fade extends StatelessWidget {
  const Fade({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final _tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration.zero, duration: const Duration(milliseconds: 700))
          .animate(AniProps.offset, tween: Tween(begin: 100.0, end: 0.0))
      ..addScene(
              begin: Duration.zero, duration: const Duration(milliseconds: 700))
          .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0));

    return PlayAnimation<TimelineValue>(
      tween: _tween, // value for offset x-coordinate
      duration: const Duration(milliseconds: 700),
      child: child,
      builder: (context, child, value) {
        return Transform.translate(
          offset: Offset(
              0,
              value
                  .get(AniProps.offset)), // use animated value for x-coordinate
          child: Opacity(
            opacity: value.get(AniProps.opacity),
            child: child,
          ),
        );
      },
    );
  }
}
