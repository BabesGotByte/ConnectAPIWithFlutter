import 'package:flutter/material.dart';
import 'package:untitled/ConnectPostRequest.dart';

class InputReqResPostRequest extends StatefulWidget {
  InputReqResPostRequest({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _InputReqResPostRequestState createState() => _InputReqResPostRequestState();
}

class _InputReqResPostRequestState extends State<InputReqResPostRequest> {

  late TextEditingController myController1;
  late TextEditingController myController2;
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
            TextField(
              controller: myController1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            TextField(
            controller: myController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Job',
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ConnectPostRequest(title: widget.title, name: myController1.text, job: myController2.text)));
              },
              child: Text("Make Request"),
            ),
          ],
        ),
      ),
    );
  }
}
