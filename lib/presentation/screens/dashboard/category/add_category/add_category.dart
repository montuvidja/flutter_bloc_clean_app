part of 'add_category_imports.dart';

@RoutePage()
class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: MyColors.primaryColor,
        title: MyStrings.addCategory.text
            .size(16.sp)
            .color(MyColors.white)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyStrings.title.text
                .size(14)
                .fontWeight(FontWeight.w500)
                .make(),
            const RoundedCornerTextField(),
            15.h.heightBox,
            MyStrings.slug.text
                .size(14)
                .fontWeight(FontWeight.w500)
                .make(),
            const RoundedCornerTextField(),
            const Spacer(),
            RoundedPrimaryButton(title: MyStrings.add, voidCallback: (){})
            
          ],
        ),
      ),
    );
  }
}
