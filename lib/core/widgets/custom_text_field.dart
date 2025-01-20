import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {required this.borderColor,
      super.key,
      required this.hint,
      required this.validator,
      this.PrifixIcon,
      this.SuffixIcon,
        this.isPassword= false
      });


  Icon? PrifixIcon;
  Icon? SuffixIcon;
  String hint;
  Color borderColor;
  bool isPassword ;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();
  late bool isPasswordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    isPasswordVisible = !widget.isPassword;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: widget.validator,
      obscureText: widget.isPassword && !isPasswordVisible,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
        )
            : widget.SuffixIcon,
        prefixIcon: widget.PrifixIcon,
        hintText: widget.hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: widget.borderColor, width: 2)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: widget.borderColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: widget.borderColor, width: 2),
        ),
      ),
    );
  }
}
