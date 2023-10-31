part of 'tags_imports.dart';

@RoutePage<Tag>()
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
              onPressed: () {
               tagsCubit.gotoAddTags(context);
              },
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.white,
              ))
        ],
      ),
      body: BlocBuilder<TagsCubit, TagsState>(
        bloc: tagsCubit,
        builder: (context, state) {
          if(state is TagsLoadingState){
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is TagsLoadedState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemCount: state.tagsModel.tags!.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 5,),
                  itemBuilder: (context, index) {
                    var tagsData = state.tagsModel.tags![index];
                    return Card(
                      color: MyColors.white,
                      child: ListTile(
                        leading: "${index + 1}".text.size(16.sp).make(),
                        title: tagsData.title!.text.size(16.sp).make(),
                        trailing:  SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: (){
                                  tagsCubit.gotoUpdateTags(context,tagsData);
                                },
                                icon: const Icon(FeatherIcons.edit2,
                                  color: Colors.green,),
                              ),
                              IconButton(
                                onPressed: () {
                                  tagsCubit.deleteTags(tagsData.id.toString(),index,context);
                                },
                                icon: const Icon(
                                  FeatherIcons.trash2,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          AutoRouter.of(context).pop<Tag>(tagsData);
                        },
                      ),
                    );
                  }),
            );
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
    );
  }
}
