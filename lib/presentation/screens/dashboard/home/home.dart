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

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220.h,
              width: double.infinity,
              child: PageView.builder(
                itemCount: headerScrollView.length,
                controller: viewModel.pageController,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    child: headerScrollView[index],
                  );
                },
                onPageChanged: (ini) {},
              ),
            ),
            SmoothPageIndicator(
              controller: viewModel.pageController,
              count: headerScrollView.length,
              effect: const WormEffect(
                dotHeight: 10.0,
                dotWidth: 10.0,
                activeDotColor: MyColors.primaryColor,
              ),
            ),
            8.h.heightBox,
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
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => AutoRouter.of(context).push(
                            HomeDetailRoute(
                                postTitle:
                                    "NetFlix Will charge money for password Sharing"),
                          ),
                          child: Assets.images.netflix
                              .image(
                                height: 110.h,
                                width: 160.w,
                                fit: BoxFit.cover,
                              )
                              .cornerRadius(24),
                        ),
                        10.h.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "NetFlix Will charge money for password Sharing"
                                .text
                                .size(16.sp)
                                .fontWeight(FontWeight.w700)
                                .maxLines(2)
                                .make(),
                            5.h.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  FeatherIcons.clock,
                                  size: 16,
                                  color: Colors.blueGrey,
                                ),
                                5.h.widthBox,
                                "6 month later"
                                    .text
                                    .size(10.sp)
                                    .color(Colors.blueGrey)
                                    .make()
                              ],
                            ),
                            5.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "129 views"
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
