import 'package:flutter/material.dart';
import 'package:schedule/main.dart';
import 'package:schedule/util.dart';

class Starter extends StatelessWidget {
  final Color themeColor = Colors.pink, themeAccent = Colors.pinkAccent, themeShade = Colors.pink.shade50;

  Widget buildButton(BuildContext context) {
    return RaisedButton(
      color: themeAccent,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Scheduler',)));
      },
      child: Text('Get started', style: TextStyle(color: Colors.white),),
    );
  }

  Widget buildDot(Color c) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: c,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildDotsIndicator(List<Color> colors) {
    return Row(children: colors.map((c) => buildDot(c)).toList(),);
  }

  Widget buildPage(BuildContext context, String title, String src, List<Color> colors) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      padding: EdgeInsets.symmetric(vertical: 200),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Text(title),
          ),
          Positioned(
            top: 100,
            child: framePicture(src, 100, 100),
          ),
          if (title == 'Be successful')
            Positioned(
              bottom: 50,
              child: buildButton(context),
            ),
          Positioned(
            bottom: 0,
            child: buildDotsIndicator(colors),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          buildPage(context, 'Track your hours', 'assets/goal.png', [themeAccent, themeShade, themeShade]),
          buildPage(context, 'Keep in touch', 'assets/discussion.png', [themeShade, themeAccent, themeShade]),
          buildPage(context, 'Be successful', 'assets/high-five.png', [themeShade, themeShade, themeAccent]),
        ],
      ),
    );
  }
}