part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileCubit profileCubit;

  @override
  void initState() {
    profileCubit = ProfileCubit(repository: context.read<Repository>());
    profileCubit.getUserPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              profileCubit.userLogout(context);
            },
            icon: const Icon(
              FeatherIcons.logOut,
              color: MyColors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: profileCubit,
        builder: (context, state) {
          if (state is UserPostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserPostSuccessState) {
            return ListView(children: [
              Container(
                height: 420,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      /* CircleAvatar(
                        radius: 60,
                       // backgroundImage: NetworkImage(state.profileModel.userDetails!.profilePhotoUrl!.toString()),
                        backgroundImage: CachedNetworkImageProvider(state.profileModel.userDetails!.profilePhotoUrl!.toString()),
                      ),*/
                      CircleAvatar(
                        radius: 60,
                        // Adjust the radius as needed
                        backgroundColor: Colors.grey,
                        // Background color for the CircleAvatar
                        child: CachedNetworkImage(
                          imageUrl: state
                              .profileModel.userDetails!.profilePhotoUrl!
                              .toString(),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                      ),
                      10.h.heightBox,
                      state.profileModel.userDetails!.name!.text.white.xl2
                          .make(),
                      state.profileModel.userDetails!.email!.text.white.xl
                          .make(),
                      20.h.heightBox,
                      SizedBox(
                        child: state.profileModel.userDetails!.about != null
                            ? state.profileModel.userDetails!.about!.text
                                .size(16)
                                .align(TextAlign.center)
                                .white
                                .makeCentered()
                            : 80.h.heightBox,
                      ),
                      30.h.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                state.profileModel.postsCount!.text.white.xl3
                                    .make(),
                                "Posts".text.white.make()
                              ],
                            ),
                            Column(
                              children: [
                                0.text.white.xl3.make(),
                                "Following".text.white.make()
                              ],
                            ),
                            Column(
                              children: [
                                0.text.white.xl3.make(),
                                "Followers".text.white.make()
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "My Posts".text.bold.xl2.make(),
                    12.h.heightBox,
                    Container(
                      child: state.profileModel.posts!.isNotEmpty
                          ? GridView.builder(
                              itemCount: state.profileModel.posts!.length!,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 13,
                                      childAspectRatio: 0.9),
                              itemBuilder: (BuildContext context, int index) {
                                var posts = state.profileModel.posts![index];
                                var imagePath = posts.featuredimage
                                    .toString()
                                    .prepend(
                                        "https://techblog.codersangam.com/")
                                    .replaceAll("public", "storage");
                                return Column(children: [
                                  // Assets.images.netflix.image().cornerRadius(12),
                                  CachedNetworkImage(
                                    imageUrl: imagePath,
                                    fit: BoxFit.cover,
                                  ).cornerRadius(12),
                                  8.h.heightBox,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /*posts.title!
                                    .text
                                    .maxLines(2)
                                    .ellipsis
                                    .make()
                                    .expand(),*/
                                      Text(
                                        posts.title!.toString(),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ).expand(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              FeatherIcons.moreVertical))
                                    ],
                                  ).expand()
                                ]);
                              },
                            )
                          : const Center(
                              child: Text(
                                "Post not found",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black38),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ]);
          } else if (state is UserPostErrorState) {
            return Center(
              child: state.errorMessage.text
                  .size(20)
                  .color(MyColors.primaryColor)
                  .makeCentered(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
