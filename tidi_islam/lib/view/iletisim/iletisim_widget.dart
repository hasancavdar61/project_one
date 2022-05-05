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
            return Text(
              'İletişim',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            );
          }
        },
      ),
    );
  }
}
