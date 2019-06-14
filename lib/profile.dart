import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String title = 'Profile';

  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  int currentIndex = 0;
  final double _profileSize = 125;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildProfilePicture(String source) {
    return Container(
      width: _profileSize,
      height: _profileSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(source),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildProfilePicture('assets/IMG_2867.JPG'),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Jane Doe', style: TextStyle(fontSize: 24),),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text('Part-time Employee'),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Phone: 000.000.0000'),
                Text('Email: jane.doe@mail.com'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}