import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Animationbuilder extends StatefulWidget {
  Widget child;
  // final Widget? child;

  Animationbuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Animationbuilder> createState() => _AnimationbuilderState();
}

class _AnimationbuilderState extends State<Animationbuilder>
    with TickerProviderStateMixin {
  late final AnimationController _controller, _cntropacity;
  bool play = false;

  late final Animation<double> _animation, animationopacity;
  @override
  void initState() {
    super.initState();
    _cntropacity = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animationopacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_cntropacity);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _animation = Tween(begin: 50.0, end: 0.0).animate(_controller);
    _controller.forward();
    _cntropacity.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _cntropacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: FadeTransition(opacity: animationopacity, child: widget.child),
        );
      },
    );
  }
}
