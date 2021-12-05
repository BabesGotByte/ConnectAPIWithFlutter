import 'package:flutter/material.dart';
import 'package:untitled/InputReqResPostRequest.dart';

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
            FlatButton(
             onPressed: () {
               Navigator.pushReplacement(
                   context, MaterialPageRoute(builder: (_) => InputReqResPostRequest(title: widget.title,)));
             },
              child: Text("ReqRes PostRequest"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => InputReqResPostRequest(title: widget.title,)));
              },
              child: Text("ReqRes PostRequest"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => InputReqResPostRequest(title: widget.title,)));
              },
              child: Text("ReqRes PostRequest"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => InputReqResPostRequest(title: widget.title,)));
              },
              child: Text("ReqRes PostRequest"),
            ),
          ],
        ),
      ),
    );
  }
}