import 'package:base_api/api/user_api.dart';
import 'package:base_api/model/user/user.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late Future<User> user;

  @override
  void initState() {
    final result = fetchUser();
    user = result;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data!;
          print(user.name);
          return Scaffold(
            appBar: AppBar(
              title: Text("${user.name}"),
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Unknown"),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Future<User> fetchUser() async {
    return await UserApi().getUser(widget.id);
  }
}
