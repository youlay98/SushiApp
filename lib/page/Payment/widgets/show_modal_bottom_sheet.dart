import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/provider_models/pyment.dart';

showModalBottomSheetf(BuildContext context, TextEditingController controller) {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final double hightSize = MediaQuery.of(context).size.height;
  final double widthSize = MediaQuery.of(context).size.width;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        height: hightSize * 0.5,
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Enter Your Code Promot',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        prefixIcon: const Icon(Icons.discount_rounded),
                        fillColor: const Color.fromARGB(255, 220, 217, 217),
                        label: const Text(
                          'PROMO CODE',
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'The field is Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(widthSize * 0.9, hightSize * 0.08),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  icon: const Icon(Icons.check_circle_outline_outlined),
                  label: const Text(
                    'check the code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () async {
                    final isvalid = formkey.currentState!.validate();
                    if (!isvalid) {
                      return;
                    }
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: ((context) => const Center(
                              child: CircularProgressIndicator(),
                            )));
                    await Provider.of<Pyment>(context, listen: false)
                        .checkIfcodePromoExist(
                      controller.text.trim(),
                      context,
                    );
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
