import 'package:flutter/material.dart';
import 'dart:math' as math;

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _columnsCount = 2;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${_scrollController.hasClients ? _scrollController.position.pixels.toInt().toString() : 0} pixels'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'grid_on',
            onPressed: () {
              if (_columnsCount < 5) {
                setState(() {
                  _columnsCount++;
                });
              }
            },
            child: Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'grid_off',
            onPressed: () {
              if (_columnsCount > 2) {
                setState(() {
                  _columnsCount--;
                });
              }
            },
            child: Icon(
              Icons.grid_off,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'arrow_upward',
            onPressed: () {
              // スクロールにアニメーションを設定
              _scrollController.animateTo(
                // アニメーションのターゲット値
                // 何pixelsまで画面を移動させるか。
                0,
                // アニメーションの時間
                duration: Duration(milliseconds: 600),
                // どんなアニメーションにするか
                curve: Curves.easeInQuint,
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        // itemCount: 10,
        controller: _scrollController,
        // グリッドの列数や行数や間隔やサイズなどを設定する
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 一行あたりにグリッドをいくつ置くか
          crossAxisCount: _columnsCount,
          // 縦線幅
          crossAxisSpacing: 5,
          // 横線幅
          mainAxisSpacing: 10,
        ),
        // グリッドの要素に表示するウィジェットを作成する
        itemBuilder: (context, index) {
          final gridItemColor =
              Color((math.Random(index).nextDouble() * 0x00FFFFFF).toInt())
                  .withOpacity(1);
          final gridItemBrightness = gridItemColor.computeLuminance();
          return Stack(
            children: [
              Container(
                color: gridItemColor,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      fontSize: 36,
                      color: gridItemBrightness > 0.5
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Text(
                  gridItemColor
                      .toString()
                      .toUpperCase()
                      .substring(6, 16)
                      .replaceAll('0x', '#'),
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        gridItemBrightness > 0.5 ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
