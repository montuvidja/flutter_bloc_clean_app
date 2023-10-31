part of 'update_category_imports.dart';

@RoutePage<CategoryModel>()
class UpdateCategory extends StatefulWidget {
  const UpdateCategory({super.key, required this.category});
  final Category category;
  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  late CategoryCubit categoryCubit;

  @override
  void initState() {
    categoryCubit = CategoryCubit(repository: context.read<Repository>());
    categoryCubit.textEditingController.text = widget.category.title.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: MyColors.primaryColor,
        title:
            MyStrings.updateCategory.text.size(16.sp).color(MyColors.white).make(),
      ),
      body: Form(
        key: categoryCubit.formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStrings.title.text.size(14).fontWeight(FontWeight.w500).make(),
              RoundedCornerTextField(
                controller: categoryCubit.textEditingController,
              ),
              15.h.heightBox,
              MyStrings.slug.text.size(14).fontWeight(FontWeight.w500).make(),
              RoundedCornerTextField(
                controller: categoryCubit.textEditingController,
              ),
              const Spacer(),
              BlocBuilder<CategoryCubit, CategoryState>(
                bloc: categoryCubit,
                builder: (context, state) {
                  return RoundedPrimaryButton(
                    title: MyStrings.update,
                    voidCallback: () {
                      categoryCubit.updateCategory(context,widget.category.id.toString());
                    },
                    isLoading: state is CategoryUpdateLoadingState,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
