import 'package:flutter/material.dart';
import 'package:schedule/timeslot.dart';
import 'package:schedule/util.dart';

final double padding = 50, fontSize = 18;

class Availability extends StatefulWidget {
  final String title = 'Availability';

  @override
  State<StatefulWidget> createState() => AvailabilityState();
}

class AvailabilityState extends State<Availability> {
  final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

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
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: daysOfWeek.map((day) =>
              ListTile(
                title: Text(day.toUpperCase(), style: titleBold),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TimeSlot(title: day, day: daysOfWeek.indexWhere((d) => day == d),)),);
                },
              )
          ).toList(),
        ),
      ),
    );
  }
}