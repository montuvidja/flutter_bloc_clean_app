part of 'common_widget_imports.dart';

class RoundedPrimaryButton extends StatelessWidget {
  const RoundedPrimaryButton({
    super.key, required this.title, required this.voidCallback, this.isLoading,
  });
  final String title;
  final VoidCallback voidCallback;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: voidCallback,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: isLoading == true ? const CircularProgressIndicator(color: MyColors.white,) : title.text
          .size(16.sp)
          .white
          .fontWeight(FontWeight.w500)
          .makeCentered(),
    );
  }
}

