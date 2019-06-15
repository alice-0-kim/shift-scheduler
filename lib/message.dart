import 'package:flutter/material.dart';
import 'package:schedule/page.dart';
import 'package:schedule/profile.dart';
import 'package:schedule/util.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessageState();
}

class MessageState extends State<Message> {
  TextEditingController controller = TextEditingController();

  Widget _buildEntry(BuildContext context, User user) {
    return ListTile(
      title: Text(user.name.toUpperCase(), style: titleBold,),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            Page(title: 'Profile', body: Profile(name: user.name, profession: user.profession, phone: user.phone, email: user.email))),);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TextField(
//            decoration: InputDecoration(
//              co
//            ),
            controller: controller,
          ),
          for (int i = 0; i < users.length; i++) _buildEntry(context, users[i]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.message),
      ),
    );
  }
}