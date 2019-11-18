import 'package:flutter/material.dart';
import 'package:flutter_app/page/details.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MaterialApp(title: "My App", home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List post;

  Future<bool> _getPost() async{

    String URL ="https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(URL);
    setState(() {
      post = jsonDecode(response.body.toString());
    });
  }

  @override
  void initState(){
    super.initState();
    this._getPost();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: ListView.builder(
        itemCount: post.length ==null?0:post.length,
          itemBuilder: (BuildContext context, int index){
          return Column(
            children: <Widget>[
              ListTile(
//                leading: CircleAvatar(child: Text(post[index]['name'][0])),
                title: Text(post[index]['title']),

                onTap: (){
                  Route route = MaterialPageRoute(builder: (context) => details(post[index]));
                  Navigator.push(context, route);
                },
              )

            ],
          );
          },
      )
    );
  }

}


