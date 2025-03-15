import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool isPass;
  final IconData icon;
  final TextEditingController textEditingController;
  const TextFormFieldWidget({super.key, required this.hintText,required this.isPass, required this.icon, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black,),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
