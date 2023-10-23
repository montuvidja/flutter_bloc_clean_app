part of 'widget_imports.dart';

class OnBoardFirst extends StatelessWidget {
  const OnBoardFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Assets.images.onboard1.image(
          height: 350.h,
          width: 390.w,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 24, 10, 24),
          child: MyStrings.onBoardFirst.text
              .size(15.sp)
              .fontWeight(FontWeight.w500)
              .align(TextAlign.center)
              .makeCentered(),
        ),
      ],
    );
  }
}