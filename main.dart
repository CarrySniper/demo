import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController, tabController1, tabController2, tabController3;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this); //TAB0 TAB1
    tabController1 = TabController(length: 2, vsync: this); //TAB00 TAB01
    tabController2 = TabController(length: 2, vsync: this); //TAB000 TAB001
    tabController3 = TabController(length: 2, vsync: this); //TAB010 TAB011
  }

  @override
  void dispose() {
    tabController.dispose();
    tabController1.dispose();
    tabController2.dispose();
    tabController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tab Demo")),
      body: Column(
        children: <Widget>[
          ExtendedTabBar(
            indicator: const ColorTabIndicator(Colors.blue),
            labelColor: Colors.black,
            tabs: const <ExtendedTab>[
              ExtendedTab(
                text: 'Tab0',
              ),
              ExtendedTab(
                text: 'Tab1',
              ),
            ],
            controller: tabController,
          ),
          Expanded(
            child: ExtendedTabBarView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ExtendedTabBar(
                      indicator: const ColorTabIndicator(Colors.red),
                      labelColor: Colors.black,
                      tabs: const <ExtendedTab>[
                        ExtendedTab(text: 'Tab00'),
                        ExtendedTab(text: 'Tab01'),
                      ],
                      controller: tabController1,
                    ),
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          /// 第三层 第一个
                          Column(
                            children: <Widget>[
                              ExtendedTabBar(
                                indicator: const ColorTabIndicator(Colors.green),
                                labelColor: Colors.black,
                                tabs: const <ExtendedTab>[
                                  ExtendedTab(text: 'Tab000'),
                                  ExtendedTab(text: 'Tab001'),
                                ],
                                controller: tabController2,
                              ),
                              Expanded(
                                child: ExtendedTabBarView(
                                  children: <Widget>[
                                    Container(color: Colors.red),
                                    Container(color: Colors.orange),
                                  ],
                                  controller: tabController2,
                                ),
                              )
                            ],
                          ),

                          // TODO: 用下面代码替换黄、绿色页面是正常的
                          // Container(color: Colors.yellow, alignment: Alignment.center, child: Text('TAB01')),

                          /// 第三层 第二个
                          /// 代码同上，除了tabController和名称
                          Column(
                            children: <Widget>[
                              ExtendedTabBar(
                                indicator: const ColorTabIndicator(Colors.green),
                                labelColor: Colors.black,
                                tabs: const <ExtendedTab>[
                                  ExtendedTab(text: 'Tab010'),
                                  ExtendedTab(text: 'Tab011'),
                                ],
                                controller: tabController3,
                              ),
                              Expanded(
                                child: ExtendedTabBarView(
                                  children: <Widget>[
                                    Container(color: Colors.yellow),// 黄色
                                    Container(color: Colors.green),// 绿色
                                  ],
                                  controller: tabController3,
                                ),
                              )
                            ],
                          ),
                        ],
                        controller: tabController1,
                      ),
                    )
                  ],
                ),
                Container(color: Colors.cyanAccent, alignment: Alignment.center, child: Text('TAB1')),//青色
              ],
              controller: tabController,
            ),
          )
        ],
      ),
    );
  }
}
