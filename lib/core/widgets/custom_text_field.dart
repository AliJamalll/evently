import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {required this.borderColor,
      super.key,
      required this.hint,
       this.validator,
      this.PrifixIcon,
      this.SuffixIcon,
        this.isPassword= false,
        this.controller
      });


  Icon? PrifixIcon;
  Icon? SuffixIcon;
  String hint;
  Color borderColor;
  bool isPassword ;
  TextEditingController? controller ;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  late bool isPasswordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPasswordVisible = !widget.isPassword;
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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
