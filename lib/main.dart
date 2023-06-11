import 'package:flutter/material.dart';
import 'package:practice_gridview/hero_page.dart';
import 'grid_view_page.dart';
import 'open_container_page.dart';
import 'shared_axis_transition_page.dart';
import 'sliver_app_bar_page.dart';
import 'shrinkable_footer_page.dart';
import 'responsive_design_page.dart';
import 'transition_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 中央ではなく上部から始める
          children: [
            ElevatedButton(
              // TextButtonではなくElevatedButtonを使う
              style: ElevatedButton.styleFrom(
                // ボタンのスタイルを指定する
                // primary: Colors.red, // 背景色を透明にする
                // elevation: 0, // 影を消す
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
                padding: const EdgeInsets.all(8.0),
              ),

              child: Text('Grid View Page'),
              onPressed: () {
                // main.dartからgrid_view_page.dartに遷移する
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GridViewPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // 同様にTextButtonをElevatedButtonに変える
              style: ElevatedButton.styleFrom(
                // primary: Colors.transparent,
                // elevation: 0,
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
              ),
              child: Text('Sliver App Bar Page'),
              onPressed: () {
                // main.dartからsliver_app_bar_page.dartに遷移する
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SliverAppBarPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // 同様にTextButtonをElevatedButtonに変える
              style: ElevatedButton.styleFrom(
                // primary: Colors.transparent,
                // elevation: 0,
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
              ),
              child: Text('Shrinkable Footer Page'),
              onPressed: () {
                // main.dartからshrinkable_footer_page.dartに遷移する
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShrinkableFooterPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // 同様にTextButtonをElevatedButtonに変える
              style: ElevatedButton.styleFrom(
                // primary: Colors.transparent,
                // elevation: 0,
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
              ),
              child: Text('Responsive Design Page'),
              onPressed: () {
                // main.dartからshrinkable_footer_page.dartに遷移する
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResponsiveDesignPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
              ),
              child: Text('Hero Page'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HeroFromPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
              ),
              child: Text('Transition Page'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TransitionPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
              ),
              child: Text('Open Container Page'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OpenContainerPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screen_width * 0.7, screen_height * 0.05),
              ),
              child: Text('Shared Axis Transition Page'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SharedAxisTransitionPage()));
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
