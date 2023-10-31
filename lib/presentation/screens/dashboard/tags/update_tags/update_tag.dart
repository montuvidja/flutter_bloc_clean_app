part of 'update_tag_imports.dart';

@RoutePage<TagsModel>()
class UpdateTag extends StatefulWidget {
  const UpdateTag({super.key, required this.tag});
  final Tag tag;
  @override
  State<UpdateTag> createState() => _UpdateTagState();
}

class _UpdateTagState extends State<UpdateTag> {
  late TagsCubit tagsCubit;

  @override
  void initState() {
    tagsCubit = TagsCubit(repository: context.read<Repository>());
    tagsCubit.tagEditorController.text = widget.tag.title.toString();
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
            MyStrings.updateTag.text.size(16.sp).color(MyColors.white).make(),
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
                    title: MyStrings.update,
                    voidCallback: () {
                      tagsCubit.updateTag(context,widget.tag.id.toString());
                    },
                    isLoading: state is TagsUpdateLoadingState,
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
