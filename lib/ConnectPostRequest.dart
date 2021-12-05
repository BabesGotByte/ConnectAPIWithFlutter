import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ConnectPostRequest extends StatefulWidget {
  ConnectPostRequest({Key? key, required this.title, required this.name, required this.job}) : super(key: key);
  final String title;
  final String name;
  final String job;
  @override
  _ConnectPostRequestState createState() => _ConnectPostRequestState();
}

class _ConnectPostRequestState extends State<ConnectPostRequest> {

  late Future<String> output;
  late TextEditingController myController1;
  late TextEditingController myController2;
  Future<String> makePostRequest(String name, String jobtitle) async {
    final url = Uri.parse("https://reqres.in/api/users");
    final json = {"name": name,"job": jobtitle};
    final response = await post(url, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    var responseData = jsonDecode(response.body);
    if(responseData["status"]=="SUCCESS"){
      return response.body;
    }
    else if(responseData["status"]=="ERROR"){
      final snackBar = SnackBar(content: Text("ERROR"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return "ERROR";
  }

  @override
  void initState(){
    output = makePostRequest(widget.name, widget.job);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              output.toString() ,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}