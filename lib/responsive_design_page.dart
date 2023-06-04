import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text('様々なでデバイスに対応する。'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isPortrait = height > width;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 650,
        ),
        child: Column(
          children: [
            // const SizedBox(height: 60),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Flutter is Google's UI toolkit for building beautiful, natively compiled",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.85,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // const SizedBox(height: 60),
            Spacer(),
            if (isPortrait) FlutterLogo(size: height * 0.3),
            // const SizedBox(height: 60,),
            if (isPortrait) Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Fast Development Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.85,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // const SizedBox(height: 60,),
            Spacer(),
            SizedBox(
              height: 42,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary, // primaryから変更
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 60,),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
