import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class TimeSlot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TimeSlotState();
}

class TimeSlotState extends State<TimeSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter your availability'),
        elevation: 0,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
//        mainAxisAlignment: MainAxisAlignment.center,
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
      values: [min, max],
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
}