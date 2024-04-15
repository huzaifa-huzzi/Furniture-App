import 'package:dart_furniture_store_app/Provider/LoginProvider.dart';
import 'package:dart_furniture_store_app/Resources/RoundButton.dart';
import 'package:dart_furniture_store_app/Resources/TextInputType.dart';
import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final usernameFocus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    usernameController.dispose();
    usernameFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: mediaQuery.size.width * 0.70),
                  child:const  Image(
                    image: AssetImage('assets/images/overlap.png'),
                  ),
                ),
                SizedBox(height: mediaQuery.size.height * 0.1,),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width *0.06),
                      child: Column(
                                        children: [
                      TextInputForm(myController: emailController, focusNode: emailFocus, onFieldSubmittedView: (_){
                        Utils.focusFtn(context, emailFocus, usernameFocus);
                      }, obsecureText: false, keyboardType: TextInputType.emailAddress, hint: 'Email', onValidator: (value){
                        return value.isEmpty ? 'enter email' : null ;
                      }, iconData: Icons.email,),
                      SizedBox(height: mediaQuery.size.height * 0.04,),
                      TextInputForm(myController: usernameController, focusNode: usernameFocus, onFieldSubmittedView: (_){
                        Utils.focusFtn(context, usernameFocus, passwordFocus);
                      }, obsecureText: false, keyboardType: TextInputType.emailAddress, hint: 'username', onValidator: (value){
                        return value.isEmpty ? 'enter username' : null ;
                      }, iconData: Icons.supervised_user_circle_sharp,),
                      SizedBox(height: mediaQuery.size.height * 0.04,),
                      TextInputForm(myController: passwordController, focusNode: passwordFocus, onFieldSubmittedView: (_){
                      }, obsecureText: false, keyboardType: TextInputType.emailAddress, hint: 'Password', onValidator: (value){
                        return value.isEmpty ? 'enter Password' : null ;
                      }, iconData: Icons.lock_outline,),
                                        ],
                                      ),
                    )),
                SizedBox(height: mediaQuery.size.height * 0.05,),
                Consumer<LoginProvider>(builder: (context,provider,_){
                  return   RoundButton(title: 'Login',loading: provider.loading ,onTap: (){
                    if(_formKey.currentState!.validate()){
                    }
                    provider.loginFtn(emailController.text.toString(), usernameController.text.toString(), passwordController.text.toString(), context);
                  });
                }),

                Padding(
                  padding: EdgeInsets.only(left: mediaQuery.size.width * 0.4,top: mediaQuery.size.height * 0.02),
                  child: InkWell(
                    onTap: (){
                      Get.to({
                        Navigator.pushNamed(context, RouteName.forgot),
                      },
                        transition: Transition.upToDown,
                      );
                    },
                    child: Text.rich(TextSpan (
                      text: 'Forgot Password ?',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                    )),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: mediaQuery.size.height * 0.1,
                      child:const  Image(
                        image: AssetImage('assets/images/Group 2.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
