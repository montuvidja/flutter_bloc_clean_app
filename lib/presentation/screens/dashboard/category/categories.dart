part of 'categories_imports.dart';

@RoutePage()
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.primaryColor,
        title: MyStrings.categories.text
            .size(16.sp)
            .color(MyColors.white)
            .make(),
        actions: [
          IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const AddCategoryRoute());
              },
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 20,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Card(
              color: MyColors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    "${index+1}".text.make(),
                    10.w.widthBox,
                    MyStrings.categories.text.size(16.sp).make(),
                    const Spacer(),
                    const Icon(FeatherIcons.edit2,size: 20,color: Colors.green,),
                    12.w.widthBox,
                    const Icon(FeatherIcons.trash2,size: 20, color: Colors.red,),
                  ],
                )
              ),
            ),
          );
        }),
      ),
    );
  }
}
