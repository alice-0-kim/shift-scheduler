import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:schedule/timeslot.dart';
import 'package:schedule/util.dart';
import 'package:intl/intl.dart';

final double padding = 50, fontSize = 18;

class Availability extends StatefulWidget {
  final String title = 'Availability';

  @override
  State<StatefulWidget> createState() => AvailabilityState();
}

class AvailabilityState extends State<Availability> {
  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };
  final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  InputType inputType = InputType.date;
  bool editable = true;
  DateTime date;

  Widget _buildLabel(String day) {
    return Container(
      width: 150,
      alignment: AlignmentDirectional.centerEnd,
      child: Text(day.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),),
    );
  }

  Widget _buildDateTimeInput() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width - 200,
      child: DateTimePickerFormField(
        inputType: inputType,
        format: formats[inputType],
        editable: editable,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.calendar_today),
          labelText: 'Enter Date',
          hasFloatingPlaceholder: false,
          contentPadding: EdgeInsets.only(left: 15, top: 5.0, bottom: 15.0),
        ),
        onChanged: (dt) => setState(() => date = dt),
      ),
    );
  }

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TimeSlot()),);
                },
              )
          ).toList(),
        ),
      ),
    );
  }
}