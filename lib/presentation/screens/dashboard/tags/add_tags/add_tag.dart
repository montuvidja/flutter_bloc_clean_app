part of 'add_tag_imports.dart';

@RoutePage<TagsModel>()
class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  late TagsCubit tagsCubit;

  @override
  void initState() {
    tagsCubit = TagsCubit(repository: context.read<Repository>());
    super.initState();
  }

  @override
  void dispose() {
    tagsCubit.tagEditorController.dispose();
    super.dispose();
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
            MyStrings.addTag.text.size(16.sp).color(MyColors.white).make(),
      ),
      body: Form(
        key: tagsCubit.fromKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStrings.title.text.size(14).fontWeight(FontWeight.w500).make(),
              RoundedCornerTextField(
                controller: tagsCubit.tagEditorController,
              ),
              15.h.heightBox,
              MyStrings.slug.text.size(14).fontWeight(FontWeight.w500).make(),
              RoundedCornerTextField(
                controller: tagsCubit.tagEditorController,
              ),
              const Spacer(),
              BlocBuilder<TagsCubit, TagsState>(
                bloc: tagsCubit,
                builder: (context, state) {
                  return RoundedPrimaryButton(
                    title: MyStrings.add,
                    voidCallback: () {
                      tagsCubit.addNewTag(context);
                    },
                    isLoading: state is TagsAddLoadingState,
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
