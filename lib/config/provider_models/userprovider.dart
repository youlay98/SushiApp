import 'package:flutter/cupertino.dart';

class UserP extends ChangeNotifier {
  String? userId;
  get getuserid => userId;

  setuserid(String? userid) {
    userId = userid;
    notifyListeners();
  }
}
