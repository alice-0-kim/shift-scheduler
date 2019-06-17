import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:schedule/util.dart';

class TimeSlot extends StatefulWidget {
  TimeSlot({Key key, this.title, this.day}): super(key: key);

  final String title;
  final int day;

  @override
  State<StatefulWidget> createState() => TimeSlotState();
}

class TimeSlotState extends State<TimeSlot> {
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
    return Container(
      child: ListView(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        children: <Widget>[
          Icon(Icons.wb_sunny, color: Colors.red,),
          Container(
            height: 100,
            child: _buildSlider(context, '12 AM', '3 AM', '6 AM', 0, 6),
          ),
          Container(
            height: 100,
            child: _buildSlider(context, '6 AM', '9 AM', '12 PM', 6, 12),
          ),
          Container(
            height: 100,
            child: _buildSlider(context, '12 PM', '3 PM', '6 PM', 12, 18),
          ),
          Container(
            height: 100,
            child: _buildSlider(context, '6 PM', '9 PM', '12 AM', 18, 24),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(BuildContext context, String from, String mid, String to, double min, double max) {
    return FlutterSlider(
      values: getValues(min),
      rangeSlider: true,
      selectByTap: true,
      jump: true,
      max: max,
      min: min,
      trackBar: FlutterSliderTrackBar(
        activeTrackBarColor: Colors.redAccent,
      ),
      onDragging: (handlerIndex, lowerValue, upperValue) {setState(() {});},
      hatchMark: FlutterSliderHatchMark(
        distanceFromTrackBar: 10,
        density: 0.5, // means 50 lines, from 0 to 100 percent
        labels: [
          FlutterSliderHatchMarkLabel(percent: 0, label: from),
          FlutterSliderHatchMarkLabel(percent: 50, label: mid),
          FlutterSliderHatchMarkLabel(percent: 100, label: to),
        ],
      ),
    );
  }

  List<double> getValues(double min) {
    // TODO
    List<double> values = [];
    if (min == 0 && currentUser.days[widget.day].ame.from != -1)
      values.add(currentUser.days[widget.day].ame.from == 25 ? 0 : currentUser.days[widget.day].ame.from);
    else
      values.add(min);
    if (min == 0 && currentUser.days[widget.day].ame.to != -1)
      values.add(currentUser.days[widget.day].ame.to == 25 ? 6 : currentUser.days[widget.day].ame.to);
    else
      values.add(min);
    if (min == 6 && currentUser.days[widget.day].aml.from != -1)
      values.add(currentUser.days[widget.day].aml.from == 25 ? 6 : currentUser.days[widget.day].aml.from);
    else
      values.add(min);
    if (min == 6 && currentUser.days[widget.day].aml.to != -1)
      values.add(currentUser.days[widget.day].aml.to == 25 ? 12 : currentUser.days[widget.day].aml.to);
    else
      values.add(min);
    if (min == 12 && currentUser.days[widget.day].pme.from != -1)
      values.add(currentUser.days[widget.day].pme.from == 25 ? 12 : currentUser.days[widget.day].pme.from);
    else
      values.add(min);
    if (min == 12 && currentUser.days[widget.day].pme.to != -1)
      values.add(currentUser.days[widget.day].pme.to == 25 ? 18 : currentUser.days[widget.day].pme.to);
    else
      values.add(min);
    if (min == 18 && currentUser.days[widget.day].pml.from != -1)
      values.add(currentUser.days[widget.day].pml.from == 25 ? 18 : currentUser.days[widget.day].pml.from);
    else
      values.add(min);
    if (min == 18 && currentUser.days[widget.day].pml.to != -1)
      values.add(currentUser.days[widget.day].pml.to == 25 ? 24 : currentUser.days[widget.day].pml.to);
    else
      values.add(min);

    return values;
  }
}