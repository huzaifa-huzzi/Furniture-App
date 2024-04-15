import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  final TextEditingController myController ;
  final FocusNode  focusNode;
  final FormFieldSetter onFieldSubmittedView;
  final FormFieldValidator onValidator;
  final TextInputType keyboardType;
  final String hint;
  final bool obsecureText;
  final bool enable,autoFocus;
  final IconData iconData;
  const TextInputForm({super.key,
  required this.myController,
    this.autoFocus =false,
    required this.focusNode,
    required this.onFieldSubmittedView,
    required this.obsecureText,
    required this.keyboardType,
    required this.hint,
    this.enable = true,
    required this.onValidator,
    required this.iconData



  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       keyboardType: keyboardType,
      controller: myController,
      obscureText: obsecureText,
      enabled: enable,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(),
        prefixIcon: Icon(iconData),
      ),
      onFieldSubmitted: onFieldSubmittedView,
      validator: onValidator,
    );
  }
}
