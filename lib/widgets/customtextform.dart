import 'package:flutter/material.dart';
class CustomTextformField extends StatelessWidget {
  final Widget suffix;
  final String text;
  final TextEditingController textController;
  const CustomTextformField({super.key, required this.suffix, required this.text,required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFFBF9D1),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF9A3F3F),
            )),
        hintText: text.toString(),
        hintStyle: TextStyle(
            fontFamily: 'ARIAL_0',
            fontSize: MediaQuery.orientationOf(context) == Orientation.portrait
                ? MediaQuery.sizeOf(context).width * 0.05
                : MediaQuery.sizeOf(context).width * 0.025,
            color: const Color(0xFF9A3F3F)),
        suffixIcon: suffix,
        suffixIconColor: const Color(0xFF9A3F3F),
      ),
    );
  }
}