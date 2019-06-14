import 'package:flutter/material.dart';

class Find extends StatefulWidget {
  final String title = 'Look for a cover';

  @override
  State<StatefulWidget> createState() => FindState();
}

class FindState extends State<Find> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Find'),
        ],
      ),
    );
  }
}