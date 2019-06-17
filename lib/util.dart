import 'package:flutter/material.dart';

final Color themeColor = Colors.red, themeAccentColor = Colors.redAccent;
User currentUser;

final TextStyle titleBold = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2);

List<String> conversation = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Non sodales neque sodales ut etiam.',
  'Sodales ut eu sem integer vitae justo eget magna fermentum.',
  'Elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere.',
  'At lectus urna duis convallis convallis tellus id interdum velit.',
  'At elementum eu facilisis sed odio morbi quis commodo.',
  'Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique.',
  'Venenatis a condimentum vitae sapien. Risus quis varius quam quisque id diam vel quam.',
  'Lacus vel facilisis volutpat est velit egestas dui id.',
  '🤔',
  '❤️',
];

final List<User> users = [
  User(
    'Jane Doe',
    'Part-time employee',
    '123.456.7890',
    'jane.doe@mail.com',
    'assets/IMG_0304.JPG',
    0,
    [
      Shift(DateTime(2019, 1, 1,), 5, 0),
      Shift(DateTime(2019, 2, 2,), 7, 0),
      Shift(DateTime(2019, 3, 4,), 10, 0),
      Shift(DateTime(2019, 4, 4,), 6, 0),
    ],
    [
      Day(Interval(0,1),Interval(7,12),Interval(14,15),Interval(18,22)),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
    ],
  ),
  User(
    'Dana Smith',
    'Store manager',
    '123.456.7890',
    'd.smith@mail.com',
    'assets/IMG_2867.JPG',
    1,
    [
      Shift(DateTime(2019, 2, 1,), 10, 0),
      Shift(DateTime(2019, 6, 8,), 7, 0),
      Shift(DateTime(2019, 7, 8,), 8, 0),
      Shift(DateTime(2019, 7, 9,), 6, 0),
    ],
    [
      Day(Interval(5,6),Interval.all(),Interval(14,15),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
    ],
  ),
  User(
    'Ella Johnson',
    'Owner',
    '123.456.7890',
    'ella0912@mail.com',
    'assets/IMG_2868.JPG',
    2,
    [
      Shift(DateTime(2019, 1, 1,), 15, 0),
      Shift(DateTime(2019, 4, 2,), 7, 0),
      Shift(DateTime(2019, 5, 4,), 4, 0),
      Shift(DateTime(2019, 12, 4,), 2, 0),
    ],
    [
      Day(Interval.none(),Interval.all(),Interval.all(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
      Day(Interval.none(),Interval.none(),Interval.none(),Interval.none()),
    ],
  ),
];

class User {
  final int id;
  final String name, job, phone, email, url;
  final List<Shift> shifts;
  final List<Day> days;

  User(this.name, this.job, this.phone, this.email, this.url, this.id, this.shifts, this.days,);

  Widget getEntry(BuildContext context, Function f) {
    return ListTile(
      title: Text(name.toUpperCase(), style: titleBold,),
      subtitle: Text(job),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
      onTap: () => f(context, this),
    );
  }

  Widget framePicture(double size) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: size,
      height: size,
      decoration: BoxDecoration(
      shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(url),
        ),
      ),
    );
  }
}

Widget framePicture(String source, double w, double h) {
  return Container(
    alignment: AlignmentDirectional.center,
    width: w,
    height: h,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(source),
      ),
    ),
  );
}

class Shift {
  final DateTime time;
  final int hours, store;

  Shift(this.time, this.hours, this.store);
}


class Day {
  final Interval ame, aml, pme, pml;

  Day(this.ame, this.aml, this.pme, this.pml);
}

class Interval {
  final double from, to;

  Interval(this.from, this.to);

  factory Interval.all()  => Interval(25, 25);
  factory Interval.none() => Interval(-1, -1);
}