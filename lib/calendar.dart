import 'package:flutter/material.dart';
import 'package:schedule/style.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key, this.year, this.month, this.date}): super(key: key);

  final int year, month, date;

  factory Calendar.today() {
    DateTime today = new DateTime.now();
    print('Today: ${today.month}');
    return Calendar(year: today.year, month: today.month, date: today.day,);
  }

  @override
  State<StatefulWidget> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  final months = ['Janunary', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  static int currentYear = 2019;
  static int currentMonth = 6; // => June
  static int currentDate = 24;
  static int currentDaysOfMonth = getDaysOfMonth(currentMonth);

  static int getDaysOfMonth(int month) {
    return month == 2 ? 28 : (month % 2 == 1 && month < 8 || month % 2 == 0 && month > 7? 31 : 30);
  }

  String _getText(int index) {
    DateTime dateTime = DateTime(currentYear, currentMonth);
    int daysOfLastMonth = getDaysOfMonth(currentMonth == 0 ? 11 : currentMonth - 1);
    if (index < dateTime.weekday - 1) return '${daysOfLastMonth - dateTime.weekday + index + 2}';
    return index < currentDaysOfMonth + dateTime.weekday - 1 ? '${index + 2 - dateTime.weekday}' : '${(index + 2 - dateTime.weekday) % currentDaysOfMonth}';
  }

  Color _getColor(int index) {
    DateTime dateTime = DateTime(currentYear, currentMonth);
    if (index == currentDate) return Colors.white;
    if (index < dateTime.weekday - 1) return Colors.black38;
    return index < currentDaysOfMonth + dateTime.weekday - 1 ? Colors.black : Colors.black38;
  }


  Widget _buildTitle(int month) {
    return Row(
      children: <Widget>[
        Expanded(
          child: IconButton(icon: Icon(Icons.keyboard_arrow_left), onPressed: () {
            setState(() {
              if (currentMonth > 1) currentMonth--;
              currentDaysOfMonth = getDaysOfMonth(currentMonth);
            });
          }),
        ),
        Expanded(child: Text(months[currentMonth-1].toUpperCase(), textAlign: TextAlign.center, style: titleBold,), ),
        Expanded(
          child: IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed: () {
            setState(() {
              if (currentMonth < 12) currentMonth++;
              currentDaysOfMonth = getDaysOfMonth(currentMonth);
              print(currentDaysOfMonth);
            });
          }),
        ),
      ],
    );
  }

  Widget _buildColumn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: daysOfWeek.map((day) =>
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('${day.substring(0, 3)}', textAlign: TextAlign.center,),
            ),
          ),
      ).toList(),
    );
  }

  Widget _buildEntry() {
    return GridView.count(
      crossAxisCount: 7,
      children: List.generate(42, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentDate = index;
            });
          },
          child: Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentDate ? Colors.redAccent : Colors.transparent,
            ),
            padding: EdgeInsets.all(5),
            child: Text(_getText(index), style: TextStyle(color: _getColor(index)), textAlign: TextAlign.center,),
          ),
        );
      }),
      shrinkWrap: true,
    );
  }

  Widget _buildSchedule() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.fiber_manual_record, color: Colors.redAccent,),
              Text('1:00 PM - 5:30 PM', style: titleBold,),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.fiber_manual_record, color: Colors.redAccent,),
              Text('7:00 PM - 9:30 PM', style: titleBold,),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar(int month) {
    return Column(
      children: <Widget>[
        _buildTitle(month),
        _buildColumn(),
        _buildEntry(),
        _buildSchedule(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: _buildCalendar(widget.month),
    );
  }
}