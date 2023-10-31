part of 'home_imports.dart';

@RoutePage()
class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    var imagePath = post.featuredimage
        .toString()
        .prepend("https://techblog.codersangam.com/")
        .replaceAll("public", "storage");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: MyColors.primaryColor,
        title:
            post.title?.text.size(16.sp).ellipsis.color(MyColors.white).make(),
      ),
      body: ListView(
        children: [
          Hero(
            tag: Key(post.id.toString()),
            child: CachedNetworkImage(
              imageUrl: imagePath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                post.title!.text.bold.xl2.make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    "${post.views} Views".text.make(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                      ),
                    ),
                    "0".text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                      ),
                    ),
                    "0".text.make(),
                  ],
                ),
                HtmlWidget(
                  post.body!
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
