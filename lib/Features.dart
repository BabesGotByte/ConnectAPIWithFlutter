import 'package:flutter/material.dart';
import 'package:untitled/InputReResPatchRequest.dart';
import 'package:untitled/InputReqResDeleteRequest.dart';
import 'package:untitled/InputReqResGetRequest.dart';
import 'package:untitled/InputReqResPostRequest.dart';
import 'package:untitled/InputReqResPutRequest.dart';

class Features extends StatefulWidget {
  Features({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text("ReqRes PostRequest"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => InputReqResPostRequest(title: widget.title,)));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text("ReqRes GetRequest"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => InputReqResGetRequest(title: widget.title,)));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text("ReqRes PutRequest"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => InputReqResPutRequest(title: widget.title,)));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text("ReqRes PatchRequest"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => InputReqResPatchRequest(title: widget.title,)));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text("ReqRes DeleteRequest"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => InputReqResDeleteRequest(title: widget.title,)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}