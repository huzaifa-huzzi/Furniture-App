import 'package:dart_furniture_store_app/Provider/SinupProvider.dart';
import 'package:dart_furniture_store_app/Resources/RoundButton.dart';
import 'package:dart_furniture_store_app/Resources/TextInputType.dart';
import 'package:dart_furniture_store_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.06),
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
                        }, obsecureText: true, keyboardType: TextInputType.emailAddress, hint: 'Password', onValidator: (value){
                          return value.isEmpty ? 'enter Password' : null ;
                        }, iconData: Icons.lock_outline,),
                      ],
                    ),
                  )),
            SizedBox(height: mediaQuery.size.height * 0.03,),
            Consumer<SignupProvider>(builder: (context,provider,_){
              return  RoundButton(title: 'Sign UP', loading: provider.loading,onTap: (){
                if(_formKey.currentState!.validate()){
                }
                provider.signUpFtn(emailController.text.toString(), usernameController.text.toString(), passwordController.text.toString(), context);
              });
            }),
            SizedBox(height: mediaQuery.size.height * 0.02,),

            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: mediaQuery.size.height * 0.2,
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
