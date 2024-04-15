import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class ForgotProvider with ChangeNotifier {

  final auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  void forgot(String email,BuildContext context)async {
    setLoading(true);
    try {
      auth.sendPasswordResetEmail(email: email).then((value){
        Utils.toastMessage('We have Send you email ,kindly check it');
        Navigator.pushNamed(context, RouteName.homeScreen);
        setLoading(false);
      }).onError((error, stackTrace){
        Utils.toastMessage(error.toString());
        setLoading(false);
      });


    }catch (e){
      Utils.toastMessage(e.toString());
      setLoading(false);
    }





  }



}