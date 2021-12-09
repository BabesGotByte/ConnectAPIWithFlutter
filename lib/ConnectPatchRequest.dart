import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ConnectPatchRequest extends StatefulWidget {
  ConnectPatchRequest({Key? key, required this.title, required this.name, required this.job}) : super(key: key);
  final String title;
  final String name;
  final String job;
  @override
  _ConnectPatchRequestState createState() => _ConnectPatchRequestState();
}

class _ConnectPatchRequestState extends State<ConnectPatchRequest> {

  late TextEditingController myController1;
  late TextEditingController myController2;
  Future<void> makePatchRequest(String name, String jobtitle) async {
    final url = Uri.parse("https://reqres.in/api/users/2");
    final json = {"name": name,"job": jobtitle};
    final response = await patch(url, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    var responseData = jsonDecode(response.body);
    if(response.statusCode==200){
      print("Name : " + responseData['name'] + ", Job : " + responseData['job'] + ", CreatedAt : " + responseData['createdAt']);
    }
    else if(responseData["status"]=="ERROR"){
      final snackBar = SnackBar(content: Text("ERROR"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState(){
    makePatchRequest(widget.name, widget.job);
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
              "Output",
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