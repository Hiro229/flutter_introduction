import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenStaggeredPage extends StatefulWidget {
  @override
  _TweenStaggeredPageState createState() => _TweenStaggeredPageState();
}

class _TweenStaggeredPageState extends State<TweenStaggeredPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _integer;
  late Animation<double> _height;
  late Animation<Color?> _color;
  late Animation<BorderRadius> _borderRadius;

  final int _seconds = 5;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _seconds),
    )..addListener(() {
        setState(() {});
      });
    // 上記は以下を行うカスケード記法
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: _seconds),
    // );
    // _animationController.addListener(() { setState(() {}); });
    _integer = _animationController.drive(
      IntTween(begin: 0, end: _seconds),
    );

    _height = _animationController
        .drive(
          CurveTween(
            curve: Interval(0, 0.3),
          ),
        )
        .drive(
          Tween(begin: 0, end: 200),
        );
    _color = _animationController
        .drive(
          CurveTween(
            curve: Interval(0.3, 0.6),
          ),
        )
        .drive(
          ColorTween(begin: Colors.blueAccent, end: Colors.amber),
        );
    _borderRadius = _animationController
        .drive(
          CurveTween(
            curve: Interval(0.6, 1.0),
          ),
        )
        .drive(
          Tween(
            begin: BorderRadius.circular(0),
            end: BorderRadius.circular(100.0),
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _integer.value.toString(),
              style: TextStyle(fontSize: 64),
            ),
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 120,
                    height: _height.value,
                    decoration: BoxDecoration(
                      color: _color.value,
                      borderRadius: _borderRadius.value,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _animationController.forward,
                child: Text('再生')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _animationController.reverse,
                child: Text('逆再生')),
          ],
        ),
      ),
    );
  }
}
