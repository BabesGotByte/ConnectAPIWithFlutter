import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/ConnectGetRequest.dart';

class InputReqResGetRequest extends StatefulWidget {
  InputReqResGetRequest({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InputReqResGetRequestState createState() => _InputReqResGetRequestState();
}

class _InputReqResGetRequestState extends State<InputReqResGetRequest> {

  List<User> _postList =<User>[];

  Future<void> makeGetRequest() async {
    final url = Uri.parse("https://reqres.in/api/users");
    final response = await get(url);
    print('Status code: ${response.statusCode}');
    var responseData = jsonDecode(response.body);
    if(response.statusCode==200){
      List<dynamic> data = json.decode(response.body)['data'];
      for(int i=0;i<data.length;i++){
        User user = User(id: data[i]["id"], email: data[i]["email"], first_name: data[i]["first_name"], second_name: data[i]["last_name"], avatar: data[i]["avatar"]);
        _postList.add(user);
      }
      print(_postList.length);
    }
    else {
      final snackBar = SnackBar(content: Text("Failed to load jobs from API"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      throw Exception('Failed to load jobs from API');
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => ConnectGetRequest(title: widget.title, data: _postList)));
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
                child: Text("Calculate"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  makeGetRequest();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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