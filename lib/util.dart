import 'package:flutter/material.dart';

final Color themeColor = Colors.red, themeAccentColor = Colors.redAccent;

final TextStyle titleBold = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2);
final TextStyle titleNormal = TextStyle(letterSpacing: 2);

final List<User> users = [
  User(
    'Jane Doe',
    'Part-time employee',
    '123.456.7890',
    'jane.doe@mail.com',
    'assets/IMG_0304.JPG',
  ),
  User(
    'Dana Smith',
    'Store manager',
    '123.456.7890',
    'd.smith@mail.com',
    'assets/IMG_2867.JPG',
  ),
  User(
    'Ella Johnson',
    'Owner',
    '123.456.7890',
    'ella0912@mail.com',
    'assets/IMG_2868.JPG',
  ),
];

class User {
  String name, job, phone, email, url;

  User(this.name, this.job, this.phone, this.email, this.url);

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
//      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(source),
      ),
    ),
  );
}