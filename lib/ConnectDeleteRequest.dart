import 'package:flutter/material.dart';

class ConnectDeleteRequest extends StatefulWidget {
  ConnectDeleteRequest({Key? key, required this.title, required this.status}) : super(key: key);
  final String title;
  final bool status;
  @override
  _ConnectDeleteRequestState createState() => _ConnectDeleteRequestState();
}

class _ConnectDeleteRequestState extends State<ConnectDeleteRequest> {

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
              "Deleted : "+widget.status.toString(),
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