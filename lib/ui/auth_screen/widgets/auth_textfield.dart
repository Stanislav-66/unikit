import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscuredText;
  final TextInputType type;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? preffixIcon;
  final String? errMsg;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  const AuthTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.obscuredText,
        required this.type,
        this.suffixIcon,
        this.onTap,
        this.preffixIcon,
        this.errMsg,
        this.focusNode,
        this.validator,
        this.onChanged}
      );
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscuredText,
        keyboardType: type,
        focusNode: focusNode,
        onTap: onTap,
        cursorColor: Theme.of(context).colorScheme.primary,
        textInputAction: TextInputAction.next,
        onChanged: onChanged,
        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
        decoration: InputDecoration(

            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: theme.colorScheme.secondary
              ),
            ),

            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.tertiary),
            errorText: errMsg
        ),
      ),
    );
  }

}