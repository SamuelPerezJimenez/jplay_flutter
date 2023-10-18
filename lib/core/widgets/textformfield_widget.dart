import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    Key? key,
    this.validator,
    this.onChanged,
    this.onLongInput,
    this.onShortInput,
    required this.labelText,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.iconData,
    this.obscureText = false,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onLongInput;
  final void Function(String)? onShortInput;
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final IconData? iconData;

  @override
  TextFormFieldWidgetState createState() => TextFormFieldWidgetState();
}

class TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onChanged: (text) {
          widget.onChanged?.call(text);
          if (text.length > 3) {
            widget.onLongInput?.call(text);
          } else {
            widget.onShortInput?.call(text);
          }
        },
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText ? _obscureText : false,
        inputFormatters: widget.inputFormatters,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          prefixIcon: widget.iconData != null
              ? Icon(widget.iconData, color: Colors.grey)
              : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
    );
  }
}
