import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransitionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PageAへ遷移する',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                      return _PageA();
                    }, transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween(
                          begin: const Offset(-1, -1),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                        child: child,
                      );
                    }),
                  );
                },
                child: Text('スライド'),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                      return _PageA();
                    }, transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                      return RotationTransition(
                        turns: Tween(
                          begin: 0.0,
                          end: 2.0,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                        child: child,
                      );
                    }),
                  );
                },
                child: Text('回転'),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                      return _PageA();
                    }, transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween(
                          begin: const Offset(-1, -1),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                        child: RotationTransition(
                          turns: Tween(
                            begin: 0.0,
                            end: 2.0,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOutCubic,
                            ),
                          ),
                          child: child,
                        ),
                      );
                    }),
                  );
                },
                child: Text('組み合わせ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PageA',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text('戻る'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
