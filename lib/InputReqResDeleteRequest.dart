import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/ConnectDeleteRequest.dart';

class InputReqResDeleteRequest extends StatefulWidget {
  InputReqResDeleteRequest({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _InputReqResDeleteRequestState createState() => _InputReqResDeleteRequestState();
}

class _InputReqResDeleteRequestState extends State<InputReqResDeleteRequest> {

  bool status=true;

  Future<void> makeDeleteRequest() async {
    final url = Uri.parse("https://reqres.in/api/users/2");
    final response = await delete(url);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    var responseData = jsonDecode(response.body);
    if(response.statusCode==204){
      status=true;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => ConnectDeleteRequest(title: widget.title, status: status)));
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
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text("Delete"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  makeDeleteRequest();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}