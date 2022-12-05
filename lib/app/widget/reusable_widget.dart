import 'package:flutter/material.dart';
import 'package:rolls_apps/app/constant/color.dart';

TextField reusableTextField(
    String text, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: appPrimary,
    style: TextStyle(color: appPrimary, fontWeight: FontWeight.w600),
    decoration: InputDecoration(
      // prefixIcon: Icon(icon, color: appPrimary),
      labelText: text,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xff888888),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color(0xffE8E8E8),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 55,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        islogin ? "LOGIN" : "SIGN UP",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return appPrimary;
            }
            return appBluesoft;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
    ),
  );
}
