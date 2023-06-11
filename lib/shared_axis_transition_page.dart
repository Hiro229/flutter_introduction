import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedAxisTransitionPage extends StatefulWidget {
  @override
  _SharedAxisTransitionPageState createState() =>
      _SharedAxisTransitionPageState();
}

class _SharedAxisTransitionPageState extends State<SharedAxisTransitionPage> {
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  bool _isCatImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 800),
                reverse: !_isCatImage,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) =>
                    SharedAxisTransition(
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: _transitionType),
                child: _isCatImage ? _CatImage() : _DogImage(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<SharedAxisTransitionType>(
                    value: SharedAxisTransitionType.horizontal,
                    groupValue: _transitionType,
                    onChanged: (SharedAxisTransitionType? newValue) {
                      _updateTransitionType(newValue!);
                    }),
                const Text('X'),
                Radio<SharedAxisTransitionType>(
                    value: SharedAxisTransitionType.vertical,
                    groupValue: _transitionType,
                    onChanged: (SharedAxisTransitionType? newValue) {
                      _updateTransitionType(newValue!);
                    }),
                const Text('Y'),
                Radio<SharedAxisTransitionType>(
                    value: SharedAxisTransitionType.scaled,
                    groupValue: _transitionType,
                    onChanged: (SharedAxisTransitionType? newValue) {
                      _updateTransitionType(newValue!);
                    }),
                const Text('Z'),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black),
                onPressed: _toggleImages,
                child: Text('切り替える'))
          ],
        ),
      ),
    );
  }

  void _toggleImages() {
    setState(() {
      _isCatImage = !_isCatImage;
    });
  }

  void _updateTransitionType(SharedAxisTransitionType newType) {
    setState(() {
      _transitionType = newType;
    });
  }
}

class _CatImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Image.network(
                  'https://images.pexels.com/photos/1770918/pexels-photo-1770918.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'これは猫です。',
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DogImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Image.network(
                  'https://images.pexels.com/photos/4681107/pexels-photo-4681107.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'これは犬です。',
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
