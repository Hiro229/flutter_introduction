import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math'; // dart:mathライブラリ
import 'dart:ui';

class AnimationControllerPage extends StatefulWidget {
  @override
  _AnimationControllerPageState createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _value = 0;
  int _seconds = 15;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
    _animationController.addListener(() {
      setState(() {
        _value = _animationController.value;
      });
    });
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
              '_animationController\n.value = ',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: _animationController.value,
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  _value.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 64,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _animationController.forward,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.play_arrow),
                    Text('再生'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _animationController.reverse,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(angle: pi, child: Icon(Icons.play_arrow)),
                    Text('逆再生'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _animationController.stop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(angle: pi, child: Icon(Icons.pause)),
                    Text('一時停止'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _animationController.reset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.stop),
                    Text('停止'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _animationController.repeat,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.repeat),
                    Text('リピート'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Duration',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: 15,
                    groupValue: _seconds,
                    onChanged: (int? newValue) {
                      _updateSeconds(newValue!);
                    }),
                const Text('15秒'),
                Radio(
                    value: 30,
                    groupValue: _seconds,
                    onChanged: (int? newValue) {
                      _updateSeconds(newValue!);
                    }),
                const Text('30秒'),
                Radio(
                    value: 60,
                    groupValue: _seconds,
                    onChanged: (int? newValue) {
                      _updateSeconds(newValue!);
                    }),
                const Text('60秒'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateSeconds(int newSeconds) {
    setState(() {
      _seconds = newSeconds;
      _animationController.duration = Duration(seconds: _seconds);
    });
  }
}
