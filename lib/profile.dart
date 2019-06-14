import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.name, this. profession, this.phone, this.email}): super(key: key);
  final String title = 'Profile', name, profession, phone, email;

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

  Widget _buildProfile(String src, String name, String profession, String phone, String emailAddr) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildProfilePicture(src), // 'assets/IMG_2867.JPG'
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(name, style: TextStyle(fontSize: 24),),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(profession),
        ),
        Container(
//          width: 200,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
//            border: Border.all(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.phone), onPressed: () => launch("tel://$phone"),),
              IconButton(icon: Icon(Icons.textsms), onPressed: () => launch("tel://$phone"),),
              IconButton(icon: Icon(Icons.email), onPressed: () async {
                final Email email = Email(
                  body: 'Email body',
                  subject: 'Email subject',
                  recipients: [emailAddr],
                  cc: ['cc@example.com'],
                  bcc: ['bcc@example.com'],
//                  attachmentPath: '/path/to/attachment.zip',
                );

                await FlutterEmailSender.send(email);
              },),
            ],
          ),
        ),
      ],
    );
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
      child: _buildProfile('assets/IMG_2867.JPG', widget.name, widget.profession, widget.phone, widget.email),
    );
//    return _buildProfile('assets/IMG_2867.JPG', widget.name, widget.profession, widget.phone, widget.email);
  }
}