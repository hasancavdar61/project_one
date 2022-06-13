import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tidi_islam/model/home_model.dart';

const String baseUrl = "https://www.api.tidislam.com/home";
const String baseUrlSlider = "https://www.api.tidislam.com/slider";

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

Future<HomeModel> fetchAlbum() async {
  try {
    final response = await http
        .get(Uri.parse("https://www.api.tidislam.com/home"), headers: {
      "Content-type": "application/json",
      "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return HomeModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  } catch (e, stk) {
    print(e);
    print(stk);
    return HomeModel();
  }
}

void fetchSlider() async {
  final response =
      await http.get(Uri.parse("https://www.api.tidislam.com/home"));

  if (response.statusCode == 200) {
    List<dynamic> dataList = [];
    dataList = jsonDecode(response.body)["mobile_image"];
  } else {
    throw Exception('Failed to load jobs from API');
  }
}
