import 'package:flutter/material.dart';

class resubleTextField extends StatefulWidget {
  resubleTextField(
      {this.text,
      this.iconData,
      required this.isPassWordType,
      required this.controller,
       this.onchanged,
      Key? key});
  final String? text;
  final IconData? iconData;
  final bool isPassWordType;
  final Function(String)? onchanged;

  final TextEditingController controller;

  @override
  State<resubleTextField> createState() => _resubleTextFieldState();
}

class _resubleTextFieldState extends State<resubleTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'the value is faild';
        }
      },
      onChanged: widget.onchanged,
      controller: widget.controller,
      obscureText: widget.isPassWordType,
      enableSuggestions: widget.isPassWordType,
      autocorrect: widget.isPassWordType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white10.withOpacity(0.7)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.iconData,
          color: Colors.white,
        ),
        labelText: widget.text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.grey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
      keyboardType: widget.isPassWordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
