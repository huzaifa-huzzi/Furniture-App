import 'package:dart_furniture_store_app/Provider/ForgotPasswordProvider.dart';
import 'package:dart_furniture_store_app/Resources/RoundButton.dart';
import 'package:dart_furniture_store_app/Resources/TextInputType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    emailFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: mediaQuery.size.width * 0.52),
              child:const  Image(
                image: AssetImage('assets/images/overlap.png'),
              ),
            ),
            Text('Forgot Password ?',style: Theme.of(context).textTheme.titleSmall!.copyWith(),),
            SizedBox(height: mediaQuery.size.height * 0.1,),
            Form(
              key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.06),
                  child: Column(
                    children: [
                      TextInputForm(myController: emailController, focusNode: emailFocus, onFieldSubmittedView: (_){}, obsecureText: false, keyboardType: TextInputType.emailAddress, hint: 'Email', onValidator: (value){
                        return value.isEmpty ? 'enter Email' : null ;
                      }, iconData:Icons.email),
                    ],
                  ),
                )

            ),
            SizedBox(height: mediaQuery.size.height * 0.07,),
            Consumer<ForgotProvider>(builder: (context,provider,_){
              return  RoundButton(title: 'Forgot Password',loading: provider.loading ,onTap: (){
                     if(_formKey.currentState!.validate()){
                     }
                     provider.forgot(emailController.text.toString(), context);

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
