import 'package:flutter/material.dart';

class ConnectGetRequest extends StatefulWidget {
  ConnectGetRequest({Key? key, required this.title, required this.data}) : super(key: key);
  final String title;
  final List data;
  @override
  _ConnectGetRequestState createState() => _ConnectGetRequestState();
}

class _ConnectGetRequestState extends State<ConnectGetRequest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: (widget.data).length,
                itemBuilder: (context, index) {
                  return _tile(widget.data[index].id, widget.data[index].email, widget.data[index].first_name, widget.data[index].second_name, widget.data[index].avatar);
                })
          ],
        ),
      ),
    );
  }
}
ListTile _tile(int id, String email, String first_name, String second_name, String avatar) => ListTile(
  title: Text(first_name + second_name,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
  subtitle: Text(email),
  leading: CircleAvatar(
    radius: 30.0,
    backgroundImage:
    NetworkImage(avatar),
    backgroundColor: Colors.transparent,
  )
);

class User {
  late final int id;
  late final String email;
  late final String first_name;
  late final String second_name;
  late final String avatar;

  User({required this.id, required this.email, required this.first_name, required this.second_name, required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      second_name: json['second_name'],
      avatar: json['avatar']
    );
  }
}