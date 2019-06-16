import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  Page({Key key, this.title, this.body}): super(key: key);
  final String title;
  final Widget body;

  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: widget.body,
    );
  }
}