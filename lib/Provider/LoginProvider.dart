import 'package:dart_furniture_store_app/services/sessionManager.dart';
import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';


class LoginProvider with ChangeNotifier {

  final auth  =FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref().child('user');

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  void loginFtn(String email,String username,String password,BuildContext context) async{

    setLoading(true);
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        Navigator.pushNamed(context,RouteName.homeScreen);
        SessionManager().setUser(value.user!.uid.toString());
        Utils.toastMessage('Login Successful');
        setLoading(false);
        ref.child(value.user!.uid.toString()).set({
          'username':username,
          'password':password,
          'uid':value.user!.uid.toString(),
          'email':value.user!.email.toString(),
          'returnSecureToken':true,

        }).then((value){
          setLoading(false);
        }).onError((error, stackTrace){
          Utils.toastMessage(error.toString());
          setLoading(false);
        });
      }).onError((error, stackTrace){
        Utils.toastMessage(error.toString());
        setLoading(false);
      });

    }catch(e){
      Utils.toastMessage(e.toString());
      setLoading(false);
    }


  }

  }