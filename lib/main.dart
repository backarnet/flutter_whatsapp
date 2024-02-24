import 'package:flutter/material.dart';

import '../pages/tab_page.dart';
import 'pages/calls_page.dart';
import 'pages/chats_page.dart';
import 'pages/updates_page.dart';
import 'widgets/my_badge.dart';

const Color primary = Color(0xFF008069);
const Color white = Color(0xFFFFFFFF);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: primary,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: primary,
            foregroundColor: white,
            shadowColor: grey.withOpacity(.3),
            elevation: 3,
          )),
      home: const MainScreen(),
    );
  }
}

const List<TabPage> pages = [
  ChatsPage(pageTitle: 'Chats', badge: 24),
  UpdatesPage(pageTitle: 'Updates', badge: 0),
  CallsPage(pageTitle: 'Calls', badge: 0),
];

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: pages
                  .map((page) => Tab(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(page.pageTitle),
                              page.badge <= 0
                                  ? const SizedBox()
                                  : Row(children: [
                                      const SizedBox(width: 7),
                                      MyBadge(
                                        text: page.badge.toString(),
                                        size: 22,
                                        backgroundColor: Colors.white,
                                        foregroundColor: primary,
                                      ),
                                    ]),
                            ]),
                      ))
                  .toList()),
        ),
        body: const TabBarView(children: pages),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primary,
          elevation: 2,
          child: const Icon(
            Icons.message,
            color: white,
          ),
        ),
      ),
    );
  }
}
