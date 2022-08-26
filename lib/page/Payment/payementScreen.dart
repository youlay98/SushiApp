import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: (() {}), icon: const Icon(Icons.menu))],
        title: const Text('Payment'),
        centerTitle: true,
      ),
    );
  }
}
