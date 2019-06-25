import 'package:flutter/material.dart';
import 'package:schedule/main.dart';
import 'package:schedule/util.dart';

class Starter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StarterState();
}

class StarterState extends State<Starter> {
  final Color themeColor = Colors.pink, themeAccent = Colors.pinkAccent, themeShade = Colors.pink.shade50;

  Widget buildButton(BuildContext context) {
    return RaisedButton(
      color: themeAccent,
      onPressed: () {
        currentUser = users[0];
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colors.map((c) => buildDot(c)).toList(),
    );
  }

//  Widget buildPage(BuildContext context, String title, String src, List<Color> colors) {
//    return Container(
//      alignment: AlignmentDirectional.topCenter,
//      padding: EdgeInsets.symmetric(vertical: 200),
//      child: Stack(
//        alignment: AlignmentDirectional.center,
//        children: <Widget>[
//          Positioned(
//            top: 0,
//            child: Text(title),
//          ),
//          Positioned(
//            top: 100,
//            child: framePicture(src, 100, 100),
//          ),
////          if (title == 'Be successful')
////            Positioned(
////              bottom: 50,
////              child: buildButton(context),
////            ),
////          Positioned(
////            bottom: 0,
////            child: buildDotsIndicator(colors),
////          ),
//        ],
//      ),
//    );
//  }
  
  Widget buildPage(BuildContext context, String title, String src, List<Color> colors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(50),
          child: Text(title),
        ),
        framePicture(src, 100, 100),
      ],
    );
  }

  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
//            margin: EdgeInsets.only(bottom: 10),
            height: 500,
            child: PageView(
              onPageChanged: (index) => setState(() {currIndex = index;}),
              children: <Widget>[
                buildPage(context, 'Track your hours', 'assets/goal.png', [themeAccent, themeShade, themeShade]),
                buildPage(context, 'Keep in touch', 'assets/discussion.png', [themeShade, themeAccent, themeShade]),
                buildPage(context, 'Be successful', 'assets/high-five.png', [themeShade, themeShade, themeAccent]),
              ],
            ),
          ),
          buildDotsIndicator([currIndex == 0 ? themeAccent : themeShade, currIndex == 1 ? themeAccent : themeShade, currIndex == 2 ? themeAccent : themeShade]),
          Padding(
            padding: EdgeInsets.all(20),
            child: buildButton(context),
          ),
        ],
      ),
    );
  }
}