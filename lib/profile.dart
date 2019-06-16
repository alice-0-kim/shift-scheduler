import 'package:schedule/util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.user}): super(key: key);
  final User user;

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

  Widget _buildBody(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: _buildProfile(widget.user),
    );
  }

  Widget _buildProfile(User user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        user.framePicture(_profileSize),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(user.name, style: TextStyle(fontSize: 24),),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(user.job),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.phone), onPressed: () => launch("tel://${user.phone}"),),
              // TODO message
              IconButton(icon: Icon(Icons.textsms), onPressed: () => launch("tel://${user.phone}"),),
              IconButton(icon: Icon(Icons.email), onPressed: () async {
                final Email email = Email(
                  body: 'Email body',
                  subject: 'Email subject',
                  recipients: [user.email],
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
}