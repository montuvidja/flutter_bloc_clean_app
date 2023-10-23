part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.logOut,
              color: MyColors.white,
            ),
          )
        ],
      ),
      body: ListView(children: [
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
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(Assets.images.netflix.path),
                ),
                10.h.heightBox,
                "Montu Vidja".text.white.xl2.make(),
                "vidja.montu@gmail.com".text.white.xl.make(),
                20.h.heightBox,
                "Montu is a software engineer who is more passionate about technology. His ambition towards technology is huge."
                    .text
                    .white
                    .xl
                    .align(TextAlign.center)
                    .make(),
                30.h.heightBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          6.text.white.xl3.make(),
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
              GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 13,
                  childAspectRatio: 0.9
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                    Assets.images.netflix.image().cornerRadius(12),
                    8.h.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "NetFlix Will charge money for password Sharing"
                            .text.maxLines(3)
                            .ellipsis
                            .make().expand(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FeatherIcons.moreVertical))
                      ],
                    )
                  ]);
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
