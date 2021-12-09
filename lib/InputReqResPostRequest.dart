import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/ConnectPostRequest.dart';

class InputReqResPostRequest extends StatefulWidget {
  InputReqResPostRequest({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _InputReqResPostRequestState createState() => _InputReqResPostRequestState();
}

class _InputReqResPostRequestState extends State<InputReqResPostRequest> {

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  // late Map<String,String> map;
  var map = new Map();
  Future<void> makePostRequest(String name, String jobtitle) async {
    final url = Uri.parse("https://reqres.in/api/users");
    final json = {"name": name,"job": jobtitle};
    final response = await post(url, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    var responseData = jsonDecode(response.body);
    if(response.statusCode==201){
      map["name"]=responseData['name'];
      map["job"]=responseData['job'];
      map["id"]=responseData['id'];
      map["createdAt"]=responseData['createdAt'];
      print("Name : " + responseData['name'] + ", Job : " + responseData['job'] + ", Id : " + responseData['id'] + ", CreatedAt : " + responseData['createdAt']);
    }
    else if(responseData["status"]=="ERROR"){
      final snackBar = SnackBar(content: Text("ERROR"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => ConnectPostRequest(title: widget.title, map: map)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 50),
            TextField(
              controller: myController1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
            controller: myController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Job',
              ),
            ),
            SizedBox(height: 10),
            FlatButton(
              onPressed: () {
                makePostRequest(myController1.text, myController2.text);
              },
              child: Text("Make Request"),
            ),
          ],
        ),
      ),
    );
  }
}
