import 'package:flutter/material.dart';
import 'package:my_management/common/app_color.dart';

class InputAuth extends StatefulWidget {
  const InputAuth({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hint;
  final String icon;
  final bool obscureText;

  @override
  State<InputAuth> createState() => _InputAuthState();
}

class _InputAuthState extends State<InputAuth> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscured,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: AppColor.primary,
      ),
      decoration: InputDecoration(
        fillColor: AppColor.primary.withValues(alpha: 0.1),
        filled: true,
        prefixIcon: UnconstrainedBox(
          alignment: const Alignment(0.3, 0),
          child: ImageIcon(
            AssetImage(widget.icon),
            size: 24,
            color: AppColor.primary,
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: AppColor.primary,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColor.textBody,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
