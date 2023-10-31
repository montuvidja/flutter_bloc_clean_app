part of 'categories_imports.dart';

@RoutePage<Category>()
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late CategoryCubit categoryCubit;

  @override
  void initState() {
    categoryCubit = CategoryCubit(repository: context.read<Repository>());
    categoryCubit.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.primaryColor,
        title:
            MyStrings.categories.text.size(16.sp).color(MyColors.white).make(),
        actions: [
          IconButton(
              onPressed: () {
               categoryCubit.gotoAddCategory(context);
              },
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.white,
              ))
        ],
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: categoryCubit,
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is CategoryLoadedState) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.separated(
                  itemCount: state.categoryModel.categories!.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 5,),
                  itemBuilder: (context, index) {
                    var category = state.categoryModel.categories![index];
                    return Card(
                      color: MyColors.white,
                      child: ListTile(
                        leading:  "${index + 1}".text.size(16.sp).make(),
                        title:  category.title!.text.size(16.sp).make(),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: (){
                                  categoryCubit.gotoUpdateCategory(context,category);
                                },
                                icon: const Icon(FeatherIcons.edit2,
                                  color: Colors.green,),
                              ),
                              IconButton(
                                onPressed: () {
                                  categoryCubit.deleteCategory(category.id.toString(),index,context);
                                },
                                icon: const Icon(
                                  FeatherIcons.trash2,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          AutoRouter.of(context).pop<Category>(category);
                        },
                      )
                    );
                  }),
            );
          }
          else if (state is CategoryErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          else {
            return const SizedBox();
          }
        }
      ),
    );
  }
}
