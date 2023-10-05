
import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';
import '../util/validators.dart';

class PasswordInputField extends StatefulWidget {
  final  TextEditingController password;
  final String fieldTitle;
  final String hintText;
  final Color? backgroundColor;
  final TextInputAction? textInputAction;
  const PasswordInputField({Key? key, required this.password, required this.fieldTitle, required this.hintText, this.textInputAction, this.backgroundColor,}) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {


  bool hidePassword = true;
  bool hasSomePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.fieldTitle ,style: TextDesignConfig().bodyTitle),
        const SizedBox(height: 5),
        TextFormField(
          autofocus: false,
          obscureText: hidePassword,
          controller: widget.password,
          style: TextDesignConfig().bodyTextSmall,
          onSaved: (value) {
            widget.password.text = value!;
          },
          onChanged: (value){
            if(widget.password.text.isNotEmpty)
            {
              setState((){hasSomePassword = true;});
            }
            else {
              setState((){hasSomePassword = false;});
            }
          },
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          validator: ValidatorClass().validatePassword,
          decoration: InputDecoration(
            focusColor: ConfigColor.purple,
            filled: true,
            fillColor: widget.backgroundColor ?? ConfigColor.white,
            suffixIcon: hasSomePassword ? IconButton(
              onPressed: (){
                setState((){
                  hidePassword = !hidePassword;
                });
              },
              icon: const Icon(Icons.visibility),
            ) : null,

            contentPadding: const EdgeInsets.symmetric(vertical: 20 ,horizontal: 15),
            hintText: widget.hintText,
            hintStyle: TextDesignConfig().bodyTextSmall,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                )
            ),
          ),
        ),
      ],
    );
  }
}
