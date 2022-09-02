// ignore_for_file: file_names

import 'package:sushiapp/Models/menuitem_model.dart';
import 'package:flutter/material.dart';
import 'package:sushiapp/page/Home/widget/spiecelwedgit.dart';

class SpicelOffer extends StatefulWidget {
  const SpicelOffer({Key? key}) : super(key: key);

  @override
  State<SpicelOffer> createState() => _SpicelOfferState();
}

class _SpicelOfferState extends State<SpicelOffer>
    with TickerProviderStateMixin {
  late final AnimationController _controller, _cntropacity;
  late final Animation<double> _animation, animationopacity;
  bool play = false;
  @override
  void initState() {
    super.initState();
    _cntropacity = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animationopacity = Tween(begin: 0.0, end: 1.0).animate(_cntropacity);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = Tween(begin: 200.0, end: 0.0).animate(_controller);
    _controller.forward();
    _cntropacity.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _cntropacity.dispose();
    super.dispose();
  }

  List<menuitem> l = menuitem.piecesushi;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: l.length,
          itemBuilder: (context, index) => SpecialWedgit(l: l[index])),
    );
  }
}
