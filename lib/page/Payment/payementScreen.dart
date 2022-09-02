import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/config/provider_models/cart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sushiapp/config/provider_models/pyment.dart';
import 'package:sushiapp/page/Payment/widgets/show_modal_bottom_sheet.dart';

import '../Map/mapwidget.dart';

class PaymentScreen extends HookWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String userid = FirebaseAuth.instance.currentUser!.uid;

    useEffect(() {
      Provider.of<Pyment>(context, listen: false).getadressfromdatabase(userid);
      Provider.of<Pyment>(context, listen: false).subtotal =
          Provider.of<Cart>(context, listen: false).totalpriceofcart;
      Provider.of<Pyment>(context, listen: false).calculatestotalwithshipping(
          context, Provider.of<Cart>(context, listen: false).totalpriceofcart);
      return null;
    }, const []);
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            AspectRatio(
              aspectRatio: 3 / 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Mapwidget()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Provider.of<Pyment>(context).myAddris == null
                          ? Colors.redAccent
                          : Colors.white70,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  height: hightSize * 0.15,
                  width: widthSize * 0.9,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        height: hightSize * 0.13,
                        width: widthSize * 0.5,
                        color: Colors.white,
                        child: Image.asset('Assets/map.png'),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      SizedBox(
                        width: widthSize * 0.4,
                        child: Column(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Home',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Provider.of<Pyment>(context).myAddris == null
                                ? const Text(
                                    'you have to enter your location',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : Text(
                                    '${Provider.of<Pyment>(context).myAddris}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Peyemant method',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            AspectRatio(
              aspectRatio: 4 / 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    // color: Colors.amber,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 234, 227, 227),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: hightSize * 0.08,
                      width: hightSize * 0.08,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          'MasterCard',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '********2678',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                    const Spacer(flex: 10),
                    Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.black,
                        ),
                        height: hightSize * 0.06,
                        width: hightSize * 0.06,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Shipping cost',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('\$10',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('subtotal',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    '\$${double.parse(((Provider.of<Pyment>(context, listen: false).subtotal)).toStringAsFixed(2))}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    '\$${double.parse(((Provider.of<Pyment>(
                      context,
                    ).totale)).toStringAsFixed(2))}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 2.0,
                    color: Colors.green,
                  ),
                  fixedSize: Size(widthSize * 0.9, hightSize * 0.08),
                  backgroundColor: Colors.greenAccent.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheetf(context, controller);
                },
                icon: const Icon(Icons.check_circle),
                label: const Text('Add Voucher')),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(widthSize * 0.9, hightSize * 0.08),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {},
              child: const Text('Place order'),
            )
          ],
        ),
      ),
    );
  }
}
