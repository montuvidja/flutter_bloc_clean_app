part of 'dashboard_imports.dart';

const List<TabItem> items = [
   TabItem(
    icon: FeatherIcons.home,
  ),
   TabItem(
    icon: FeatherIcons.tag,
  ),
   TabItem(
    icon: FeatherIcons.plus,
  ),
   TabItem(
    icon: FeatherIcons.hash,
  ),
   TabItem(
    icon: FeatherIcons.user,
  ),
];

@RoutePage()
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int visit = 0;
  List<Widget> pages = [
    const Home(),
    const Categories(),
    const AddPosts(),
    const Tags(),
    const Profile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(visit),
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: MyColors.white,
        color: MyColors.primaryColor.withOpacity(0.3),
        colorSelected: MyColors.primaryColor,
        indexSelected: visit,
        onTap: (int index){
          setState(() {
            visit = index;
          });
        },
      ),
    );
  }
}
