import 'package:flutter/material.dart';
import 'package:schedule/calendar.dart';
import 'package:schedule/availability.dart';
import 'package:schedule/chart.dart';
import 'package:schedule/find.dart';
import 'package:schedule/page.dart';
import 'package:schedule/util.dart';

class Dashboard extends StatefulWidget {
  final String title = 'Dashboard';

  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  List<SimpleTimeSeriesChart> charts = [
    SimpleTimeSeriesChart.withSampleData(),
    SimpleTimeSeriesChart.withSampleData(),
    SimpleTimeSeriesChart.withSampleData(),
  ];
  int chartType = 0;
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
          height: 300.0,
          child: SimpleTimeSeriesChart.withSampleData(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButton('Day', 0),
            _buildButton('Month', 1),
            _buildButton('Year', 2),
          ],
        ),
        _buildTile('Calendar', toCalendar),
        _buildTile('Availability', toAvailability),
        _buildTile('Look for a cover', toFind),
      ],
    );
  }

  Widget _buildButton(String title, int type) {
    return FlatButton(
      child: Text(title),
      onPressed: () {
        setState(() {
          chartType = type;
        });
      },
    );
  }

  Widget _buildTile(String title, Function onTap) {
    return ListTile(
      title: Text(title.toUpperCase(), style: titleBold,),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
      onTap: () => onTap(),
    );
  }

  toCalendar() => Navigator.push(context, MaterialPageRoute(builder: (context) => Page(title: 'Calendar', body: Calendar.today())));
  toAvailability() => Navigator.push(context, MaterialPageRoute(builder: (context) => Availability()),);
  toFind() => Navigator.push(context, MaterialPageRoute(builder: (context) => Find()),);
}