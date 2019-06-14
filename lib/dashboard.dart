import 'package:flutter/material.dart';
import 'package:schedule/calendar.dart';
import 'package:schedule/availability.dart';
import 'package:schedule/chart.dart';
import 'package:schedule/style.dart';

class Dashboard extends StatefulWidget {
  final String title = 'Dashboard';

  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 200.0,
          child: SimpleTimeSeriesChart.withSampleData(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text('Day'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Month'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Year'),
            ),
          ],
        ),
        ListTile(
          title: Text('Calendar'.toUpperCase(), style: textStyle,),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Calendar.today()),);
          },
        ),
        ListTile(
          title: Text('Availability'.toUpperCase(), style: textStyle,),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Availability()),);
          },
        ),
        ListTile(
          title: Text('Look for a cover'.toUpperCase(), style: textStyle,),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }
}