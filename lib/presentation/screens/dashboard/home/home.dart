part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> headerScrollView = [
    Assets.images.netflix.image(fit: BoxFit.fitWidth).cornerRadius(24),
    Assets.images.netflix.image(fit: BoxFit.fitWidth).cornerRadius(24),
    Assets.images.netflix.image(fit: BoxFit.fitWidth).cornerRadius(24),
    Assets.images.netflix.image(fit: BoxFit.fitWidth).cornerRadius(24),
  ];

  late HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = HomeCubit(repository: context.read<Repository>());
    homeCubit.getLatestPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return Scaffold(
        body: SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedState) {
            return RefreshIndicator(
              onRefresh: ()=> homeCubit.getLatestPosts(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.h.heightBox,
                    VxSwiper.builder(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: state.homeModel.popularPosts!.length,
                        itemBuilder: (context, index) {
                          var latestPost = state.homeModel.allPosts![index];
                          var imagePath = latestPost.featuredimage
                              .toString()
                              .prepend("https://techblog.codersangam.com/")
                              .replaceAll("public", "storage");
                          return CachedNetworkImage(
                            imageUrl: imagePath,
                            width: 1.sw,
                            height: 200,
                            fit: BoxFit.fill,
                          ).cornerRadius(20).pSymmetric(h: 10);
                        }),
                    /*  SmoothPageIndicator(
                      controller: viewModel.pageController,
                      count: headerScrollView.length,
                      effect: const WormEffect(
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        activeDotColor: MyColors.primaryColor,
                      ),
                    ),*/
                    24.h.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyStrings.latestPost.text.size(14.sp).make(),
                          MyStrings.seeAll.text.size(14.sp).make(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.homeModel.allPosts!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var latestPost = state.homeModel.allPosts![index];
                          var imagePath = latestPost.featuredimage
                              .toString()
                              .prepend("https://techblog.codersangam.com/")
                              .replaceAll("public", "storage");
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FadedScaleAnimation(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => AutoRouter.of(context).push(
                                      HomeDetailRoute(
                                        post: latestPost,
                                      ),
                                    ),
                                    child: Hero(
                                      tag: Key(latestPost.id.toString()),
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath,
                                        height: 110.h,
                                        width: 160.w,
                                        fit: BoxFit.cover,
                                      ).cornerRadius(24),
                                    ),
                                  ),
                                  10.h.widthBox,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /*latestPost.title!.text
                                          .size(16)
                                          .fontWeight(FontWeight.w700)
                                          .ellipsis
                                          .maxLines(2)
                                          .make(),*/
                                      Text(
                                        latestPost.title!.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,),
                                      ),
                                      5.h.heightBox,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FeatherIcons.clock,
                                            size: 16,
                                            color: Colors.blueGrey,
                                          ),
                                          5.h.widthBox,
                                          latestPost.createdAt!
                                              .timeAgo()
                                              .toString()
                                              .text
                                              .size(10.sp)
                                              .color(Colors.blueGrey)
                                              .make()
                                        ],
                                      ),
                                      5.h.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "${latestPost.views} views"
                                              .text
                                              .size(10.sp)
                                              .color(Colors.blueGrey)
                                              .make(),
                                          const Icon(
                                            FeatherIcons.bookmark,
                                            color: Colors.blueGrey,
                                            size: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ).expand(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    ));
  }
}
