import 'package:flutter/material.dart';
import 'package:untitled/ConnectPutRequest.dart';

class InputReqResPutRequest extends StatefulWidget {
  InputReqResPutRequest({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _InputReqResPutRequestState createState() => _InputReqResPutRequestState();
}

class _InputReqResPutRequestState extends State<InputReqResPutRequest> {

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
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
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ConnectPutRequest(title: widget.title, name: myController1.text, job: myController2.text)));
              },
              child: Text("Make Request"),
            ),
          ],
        ),
      ),
    );
  }
}
