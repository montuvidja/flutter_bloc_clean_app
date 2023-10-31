part of 'common_widget_imports.dart';

class RoundedCornerTextField extends StatelessWidget {
  const RoundedCornerTextField({
    super.key,
    this.prefixIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.text = "",
    this.hint = "",
    this.borderColor = MyColors.primaryColor,
    this.onChanged,
    this.validator,
    this.controller
  });

  final Widget? prefixIcon;
  final bool isPassword;
  final bool obscureText;
  final String text;
  final String hint;
  final Color borderColor;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;



  @override
  Widget build(BuildContext context) {
    return VxTextField(
      borderColor: borderColor,
      borderRadius: 10,
      fillColor: Colors.transparent,
      borderType: VxTextFieldBorderType.roundLine,
      prefixIcon: prefixIcon,
      isPassword: isPassword,
      obscureText: obscureText,
      value: text,
      hint: hint,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
    );
  }
}
