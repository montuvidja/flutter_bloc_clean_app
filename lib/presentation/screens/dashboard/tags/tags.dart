part of 'tags_imports.dart';

@RoutePage()
class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
    late TagsCubit tagsCubit;

  @override
  void initState() {
    tagsCubit = TagsCubit(repository: context.read<Repository>());
    tagsCubit.getAllTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.primaryColor,
        title: MyStrings.tags.text.size(16.sp).color(MyColors.white).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TagsCubit, TagsState>(
          bloc: tagsCubit,
          builder: (context, state) {
            if(state is TagsLoadingState){
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is TagsLoadedState) {
              return ListView.builder(
                  itemCount: state.tagsModel.tags!.length,

                  itemBuilder: (context, index) {
                    var tagsData = state.tagsModel.tags![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Card(
                        color: MyColors.white,
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                "${index + 1}".text.make(),
                                10.w.widthBox,
                                tagsData.title!.text.size(16.sp).make(),
                                const Spacer(),
                                const Icon(
                                  FeatherIcons.edit2,
                                  size: 20,
                                  color: Colors.green,
                                ),
                                12.w.widthBox,
                                const Icon(
                                  FeatherIcons.trash2,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ],
                            )),
                      ),
                    );
                  });
            } else if (state is TagsErrorState){
              return Center(
                child: Text(state.errorMessage),
              );
            }
            else {
              return const SizedBox();
            }

          },
        ),
      ),
    );
  }
}
