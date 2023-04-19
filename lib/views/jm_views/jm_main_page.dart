import 'package:flutter/material.dart';
import 'package:pica_comic/views/jm_views/jm_home_page.dart';
import '../models/tab_listener.dart';

class JmMainPage extends StatefulWidget {
  const JmMainPage(this.tabListener, {Key? key}) : super(key: key);
  final TabListener tabListener;

  @override
  State<JmMainPage> createState() => _JmMainPageState();
}

class _JmMainPageState extends State<JmMainPage> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 1, vsync: this);
    widget.tabListener.controller = controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(tabs: const [
          Tab(text: "主页",),
        ], controller: controller,),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: const [
              JmHomePage()
            ],
          ),
        )
      ],
    );
  }
}