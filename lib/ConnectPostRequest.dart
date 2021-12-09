import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class ConnectPostRequest extends StatefulWidget {
  ConnectPostRequest({Key? key, required this.title, required this.map}) : super(key: key);
  final String title;
  final Map map;
  @override
  _ConnectPostRequestState createState() => _ConnectPostRequestState();
}

class _ConnectPostRequestState extends State<ConnectPostRequest> {

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
              "Name : "+widget.map["name"],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            Text(
              "Job : "+widget.map["job"],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            Text(
              "Id : "+widget.map["id"],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            Text(
              "CreatedAt : "+widget.map["createdAt"],
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