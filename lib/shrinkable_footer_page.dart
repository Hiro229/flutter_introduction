import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/rendering.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({Key? key}) : super(key: key);

  @override
  _ShrinkableFooterPageState createState() => _ShrinkableFooterPageState();
}

class _ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  final _scrollController = ScrollController();
  bool isHiding = false;

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  // ウィジェット利用終了時に呼び出されるdisposeにコントローラーのスクロール検知を解除する。
  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 50),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    color: Color(0xFFFEEAE6),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Text(
                        'スクロールに応じて\nBottomNavigationBarが\n縮みます。',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xFF442C2E),
                            height: 1.2),
                      ),
                      const SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  'images/flower-field.jpg',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  'images/learning.jpg',
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  'images/forest.jpg',
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  'images/road.jpg',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  'images/summer-beach-key.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: _BottomNavigationBar(
                isHiding: isHiding,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isHiding = true;
      } else {
        isHiding = false;
      }
      setState(() {});
    });
  }
}

class _BottomNavigationBar extends StatelessWidget {
  _BottomNavigationBar({required this.isHiding});

  final bool isHiding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: isHiding ? 32 : 60,
      color: Color(0xFFFEEAE6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.home,
              title: 'Home',
            ),
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.star,
              title: 'Favorite',
            ),
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.favorite,
              title: 'Like',
            ),
            _IconTextItem(
              isHiding: isHiding,
              deviceWidth: width,
              icon: Icons.settings,
              title: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}

class _IconTextItem extends StatelessWidget {
  const _IconTextItem({
    Key? key,
    required this.deviceWidth,
    required this.isHiding,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final double deviceWidth;
  final bool isHiding;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 0.25 * (deviceWidth - 32),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              icon,
              color: Color(0xFF442C2E),
              size: 24,
            ),
          ),
          AnimatedOpacity(
            opacity: isHiding ? 0 : 1,
            duration: Duration(milliseconds: 120),
            curve: Curves.easeInQuart,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
