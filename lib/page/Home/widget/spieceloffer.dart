// ignore_for_file: file_names

import 'package:sushiapp/Models/menuitem_model.dart';
import 'package:flutter/material.dart';

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

  List<menuitem> l = menuitem.kimich;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: l.length,
          itemBuilder: (context, index) => spicelOffer(index)),
    );
  }

  spicelOffer(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _animation,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 10)),
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          // color: Colors.amber,
          // padding: EdgeInsets.only(
          //     top: MediaQuery.of(context).size.height / 34,
          //     right: MediaQuery.of(context).size.width / 30),
          width: MediaQuery.of(context).size.width / 1.06,
          child: Center(
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(l[index].image),
              ),
              title: const Text(
                'Only today 20% OFF!',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('${l[index].name}\n',
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough)),
              isThreeLine: true,
              trailing: const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        builder: (
          BuildContext context,
          Widget? child,
        ) {
          return Transform.translate(
            offset: Offset(0, play ? 800 : _animation.value),
            child: FadeTransition(opacity: animationopacity, child: child),
          );
        },
      ),
    );
  }
}
