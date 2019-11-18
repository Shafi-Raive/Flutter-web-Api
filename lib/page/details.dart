import 'package:flutter/material.dart';

class details extends StatefulWidget {
  var post;
  details(this.post);

  @override
  _detailsState createState() => _detailsState(this.post);
}

class _detailsState extends State<details> {
  var post;
  _detailsState(this.post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Name : ${post['title']}"),
            Divider(),
            Text("Details : ${post['body']}"),
            Divider(),

          ],
        ),
      ),
    );
  }
}
