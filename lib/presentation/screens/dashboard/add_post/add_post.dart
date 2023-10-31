part of 'add_post_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

late AddPostCubit addPostCubit;

class _AddPostsState extends State<AddPosts> {
  @override
  void initState() {
    addPostCubit = AddPostCubit(repository: context.read<Repository>());
    super.initState();
  }

  @override
  void dispose() {
    addPostCubit.textEditingController.dispose();
    addPostCubit.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        title: MyStrings.addPost.text
            .size(16)
            .white
            .make(),
        actions: [
          BlocBuilder<AddPostCubit, AddPostState>(
            bloc: addPostCubit,
            builder: (context, state) {
              bool isLoading = false;
              if (state is AllSelectedState) {
                isLoading = state.isLoading;
              }
              return IconButton(
                  onPressed: () {
                    addPostCubit.addPost(context);
                  },
                  icon: isLoading == true ?
                  const CircularProgressIndicator(color: MyColors.white,) : const Icon(
                    FeatherIcons.check, color: MyColors.white,)
              );
            },
          )
        ],
      ),
      body: BlocBuilder<AddPostCubit, AddPostState>(
        bloc: addPostCubit,
        builder: (context, state) {
          Tag? selectedTag;
          Category? selectedCategory;
          XFile? selectedImage;

          if (state is AllSelectedState) {
            selectedTag = state.tag;
            selectedCategory = state.category;
            selectedImage = state.xFile;
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    if (selectedImage != null)
                      Image.file(
                        File(selectedImage.path),
                        height: 250,
                        width: 1.sw,
                        fit: BoxFit.cover,
                      ).cornerRadius(24)
                    else
                      Assets.images.placeholder
                          .image(height: 250)
                          .cornerRadius(24),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: IconButton(
                        onPressed: () {
                          _settingModalBottomSheet(context, addPostCubit);
                        },
                        icon: const Icon(
                          FeatherIcons.camera,
                          color: MyColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                20.h.heightBox,
                RoundedCornerTextField(
                  hint: "Title",
                  borderColor: MyColors.purple,
                  controller: addPostCubit.textEditingController,
                ),
                20.h.heightBox,
                RoundedCornerTextField(
                  hint: "Slug",
                  borderColor: MyColors.purple,
                  controller: addPostCubit.textEditingController,
                ),
                20.h.heightBox,
                InkWell(
                  onTap: () async {
                    var data = await AutoRouter.of(context)
                        .push<Tag>(const TagsRoute());
                    addPostCubit.selectedTag(data);
                  },
                  child: Container(
                    height: 60.h,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (selectedTag != null)
                          selectedTag.title!.text.size(16).make()
                        else
                          MyStrings.tags.text.size(16).make(),
                        const Icon(FeatherIcons.chevronRight),
                      ],
                    ),
                  ),
                ),
                20.h.heightBox,
                InkWell(
                  onTap: () async {
                    var data = await AutoRouter.of(context)
                        .push<Category>(const CategoriesRoute());
                    addPostCubit.selectedCategory(data);
                  },
                  child: Container(
                    height: 60.h,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (selectedCategory != null)
                          selectedCategory.title!.text.size(16).make()
                        else
                          MyStrings.categories.text.size(16).make(),
                        const Icon(FeatherIcons.chevronRight),
                      ],
                    ),
                  ),
                ),
                20.h.heightBox,
                QuillProvider(
                  configurations:
                  QuillConfigurations(controller: addPostCubit.controller),
                  child: Column(children: [
                    QuillToolbar.basic(),
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: QuillEditor.basic(
                        autoFocus: false,
                        readOnly: false,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void _settingModalBottomSheet(context, AddPostCubit addPostCubit) {
  showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () =>
                {
                  addPostCubit.pickImage(context, ImageSource.camera),
                  Navigator.pop(context)
                }),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () =>
              {
                addPostCubit.pickImage(context, ImageSource.gallery),
                Navigator.pop(context)
              },
            ),
          ],
        );
      });
}
