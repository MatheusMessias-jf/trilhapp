import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottonBarPage extends StatefulWidget {
  const BottonBarPage({super.key});

  @override
  State<BottonBarPage> createState() => _BottonBarPageState();
}

class _BottonBarPageState extends State<BottonBarPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Botton Bar Page"),
        ),
        body: TabBarView(controller: tabController, children: [
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.orange,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
        ]),
        bottomNavigationBar: ConvexAppBar.badge(
          {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
          color: Colors.white,
          backgroundColor: Colors.deepPurple,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => tabController.index = i,
          controller: tabController,
        ));
  }
}
