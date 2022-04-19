import 'package:flutter/material.dart';

import '../../services/test_service.dart';

class IletisimWidget extends StatefulWidget {
  const IletisimWidget({Key? key}) : super(key: key);

  @override
  State<IletisimWidget> createState() => _IletisimWidgetState();
}

class _IletisimWidgetState extends State<IletisimWidget> {
  late Future<User> futurePost;
  @override
  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: getRequest(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.red,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  snapshot.data[index].title.toString().toUpperCase(),
                  style: const TextStyle(color: Colors.red),
                ),
                subtitle: Text(snapshot.data[index].body,
                    style: TextStyle(color: Colors.blue.shade700)),
                contentPadding: const EdgeInsets.only(bottom: 20.0),
              ),
            );
          }
        },
      ),
    );
  }
}
