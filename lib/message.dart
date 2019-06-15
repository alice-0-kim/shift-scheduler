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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(user.name.toUpperCase(), style: titleBold,),
          Text(user.profession),
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
//            Page(title: 'Profile', body: Profile(name: user.name, profession: user.profession, phone: user.phone, email: user.email))
            Conversation()),);
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
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search name or title',
              border: InputBorder.none,
            ),
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

List<String> conversation = [
  'Hi :)',
  'How\'s life?',
  'Meh, you?',
  'Nah',
  'Good!',
  'Wanna see something cool',
  'Sure',
  'Got a new iPhone',
  'SHUT UP',
  'Ikr',
  'oathie a dshq lqeh  kedfsd yehdmdw difjs;pwoq  ndfn ehfdkjzu ebkdhfusd oathie a dshq lqeh  kedfsd yehdmdw difjs;pwoq  ndfn ehfdkjzu ebkdhfusd oathie a dshq lqeh  kedfsd yehdmdw difjs;pwoq  ndfn ehfdkjzu ebkdhfusd oathie a dshq lqeh  kedfsd yehdmdw difjs;pwoq  ndfn ehfdkjzu ebkdhfusd oathie a dshq lqeh  kedfsd yehdmdw difjs;pwoq  ndfn ehfdkjzu ebkdhfusd',
  'oathie a dshq lqeh  kedfsd yehdmdw difjs;pwoq  ndfn ehfdkjzu ebkdhfusd oathie a dshq lqeh  kedfsd yehdmdw difjs;pwoq  ndfn ehfdkjzu ebkdhfu',
];

class Conversation extends StatefulWidget {
  final String title = 'Conversation';

  @override
  State<StatefulWidget> createState() => ConversationState();
}

class ConversationState extends State<Conversation> {
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
    return Stack(
      children: <Widget>[
        ListView(
          children: [
            for (int i = 0; i < conversation.length; i++)
//              Container(
//                alignment: i % 2 == 0 ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
//                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                margin: EdgeInsets.all(5),
//                decoration: BoxDecoration(
//                  color: i % 2 == 0 ? Colors.red : Colors.grey[100],
//                  borderRadius: BorderRadius.circular(15),
//                ),
//                child: Text(conversation[i], style: TextStyle(color: i % 2 == 0 ? Colors.white : Colors.black, fontSize: 14),),
//              ),
              Align (
//                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                alignment: i % 2 == 0 ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
                child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: i % 2 == 0 ? Colors.red : Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                  child: Text(
                    conversation[i],
                    style:
                    TextStyle(
                      color: i % 2 == 0 ? Colors.white : Colors.black,
                      fontSize: 14,
//                      backgroundColor: i % 2 == 0 ? Colors.red : Colors.grey[100],
                    ),
//                    textAlign: i % 2 == 0 ? TextAlign.left : TextAlign.right,
                  ),
                ),
              ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: TextField(
              onSubmitted: (String submitted) {
                setState(() {
                  // TODO
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
                hintText: "Add comment...",
              ),
            ),
          ),
        ),
      ],
    );
  }
}