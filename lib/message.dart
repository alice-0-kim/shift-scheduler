import 'package:flutter/material.dart';
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
      subtitle: Text(user.job),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Conversation()),);
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
          padding: EdgeInsets.symmetric(horizontal: 5),
          children: [
            for (int i = 0; i < conversation.length; i++)
              Align (
                alignment: i % 2 == 0 ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: i % 2 == 0 ? Colors.red : Colors.grey[100],
                    borderRadius: i % 2 == 0
                        ? BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                        : BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Text(
                    conversation[i],
                    style:
                    TextStyle(
                      color: i % 2 == 0 ? Colors.white : Colors.black,
                      fontSize: 14,
                    ),
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
                  conversation.add(submitted);
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