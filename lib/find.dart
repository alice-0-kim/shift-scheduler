import 'package:flutter/material.dart';
import 'package:schedule/calendar.dart';
import 'package:schedule/style.dart';

import 'package:url_launcher/url_launcher.dart';

final double padding = 50, fontSize = 18;

class Find extends StatefulWidget {
  final String title = 'Look for a cover';

  @override
  State<StatefulWidget> createState() => FirstStep();
}

class FirstStep extends State<Find> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Choose a date :', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Calendar(),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondStep(date: 'May 4th, 2019')),);},
            child: Text('Next'.toUpperCase(), style: titleBold,),
          ),
        ],
      ),
    );
  }
}

class SecondStep extends StatelessWidget {
  SecondStep({Key key, this.date}): super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Look for a cover'),
        elevation: 0,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Choose time slot at ',
                        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'June 14, 2019',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: Colors.redAccent,
                            decorationThickness: 3,
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: ' :',
                        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ]
                ),
              ),
            ),
            ListTile(
              title: Text('9:00 AM - 12:30 PM'.toUpperCase(), style: titleBold,),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdStep()),);
              },
            ),
            ListTile(
              title: Text('2:00 PM - 6:30 PM'.toUpperCase(), style: titleBold,),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdStep()),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdStep extends StatelessWidget {
  final String time = '9:00 AM - 12:30 PM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Look for a cover'),
        elevation: 0,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Employees available at ',
                      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: '1 PM',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.redAccent,
                          decorationThickness: 3,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: ' shift:',
                      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ]
                ),
              ),
            ),
            ListTile(
              title: Text('Jane Doe'.toUpperCase(), style: titleBold,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: IconButton(
                      icon: Icon(Icons.call, color: Colors.black,),
                      onPressed: () => launch("tel://7789887498"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: IconButton(
                      icon: Icon(Icons.email, color: Colors.black,),
                      onPressed: () => launch("tel://7789887498"),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Dana Smith'.toUpperCase(), style: titleBold,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: IconButton(
                      icon: Icon(Icons.call, color: Colors.black,),
                      onPressed: () => launch("tel://7789887498"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: IconButton(
                      icon: Icon(Icons.email, color: Colors.black,),
                      onPressed: () => launch("tel://7789887498"),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Ella Johnson'.toUpperCase(), style: titleBold,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: IconButton(
                      icon: Icon(Icons.call, color: Colors.black,),
                      onPressed: () => launch("tel://7789887498"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: IconButton(
                      icon: Icon(Icons.email, color: Colors.black,),
                      onPressed: () => launch("tel://7789887498"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class LastStep extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Look for a cover'),
//        elevation: 0,
//      ),
//      body: _buildBody(context),
//    );
//  }
//
//  Widget _buildBody(BuildContext context) {
//    return ConstrainedBox(
//      constraints: BoxConstraints.expand(),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Icon(Icons.check, color: Colors.green,),
//          Text('Done!'),
//        ],
//      ),
//    );
//  }
//}