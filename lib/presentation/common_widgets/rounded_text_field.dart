part of 'common_widget_imports.dart';

class RoundedCornerTextField extends StatefulWidget {
  const RoundedCornerTextField({
    super.key,
    this.prefixIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.text = "",
    this.hint = "",
    this.borderColor = MyColors.primaryColor
  });

  final Widget? prefixIcon;
  final bool isPassword;
  final bool obscureText;
  final String text;
  final String hint;
  final Color borderColor;

  @override
  State<RoundedCornerTextField> createState() => _RoundedCornerTextFieldState();
}

class _RoundedCornerTextFieldState extends State<RoundedCornerTextField> {
  @override
  Widget build(BuildContext context) {
    return VxTextField(
      borderColor: widget.borderColor,
      borderRadius: 10,
      fillColor: Colors.transparent,
      borderType: VxTextFieldBorderType.roundLine,
      prefixIcon: widget.prefixIcon,
      isPassword: widget.isPassword,
      obscureText: widget.obscureText,
      hint: widget.hint,
    );
  }
}
