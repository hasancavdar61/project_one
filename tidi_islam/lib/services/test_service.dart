import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<User>> getRequest() async {
  //replace your restFull API here.
  String url = "https://jsonplaceholder.typicode.com/posts";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body);

  //Creating a list to store input data;
  List<User> users = [];
  for (var singleUser in responseData) {
    User user = User(
        id: singleUser["id"],
        userId: singleUser["userId"],
        title: singleUser["title"],
        body: singleUser["body"]);

    //Adding user to the list.
    users.add(user);
  }
  return users;
}

class User {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  User({
    this.id,
    this.userId,
    this.title,
    this.body,
  });
}




