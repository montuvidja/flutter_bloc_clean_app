part of 'add_post_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        title: MyStrings.addPost.text.size(16).white.make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.check,
                color: MyColors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Assets.images.placeholder.image().cornerRadius(24),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    FeatherIcons.camera,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            20.h.heightBox,
            const RoundedCornerTextField(
              hint: "Title",
              borderColor: MyColors.purple,
            ),
            20.h.heightBox,
            const RoundedCornerTextField(
              hint: "Slug",
              borderColor: MyColors.purple,
            ),
            20.h.heightBox,
            Container(
              height: 60.h,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyStrings.tags.text.size(16).make(),
                  const Icon(FeatherIcons.chevronRight),
                ],
              ),
            ),
            20.h.heightBox,
            Container(
              height: 60.h,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyStrings.categories.text.size(16).make(),
                  const Icon(FeatherIcons.chevronRight),
                ],
              ),
            ),
            20.h.heightBox,
            QuillProvider(
              configurations: QuillConfigurations(controller: _controller),
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
      ),
    );
  }
}
