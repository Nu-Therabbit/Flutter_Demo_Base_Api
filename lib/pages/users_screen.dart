import 'package:base_api/api/user_api.dart';
import 'package:base_api/model/user/user.dart';
import 'package:base_api/pages/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> users;

  @override
  void initState() {
    users = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Center(
        child: userListWidget(),
      ),
    );
  }

  Widget userListWidget() {
    return FutureBuilder<List<User>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              User user = snapshot.data![index];
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 8, left: 12, right: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserDetailScreen(id: user.id)),
                        );
                      },
                      splashColor: Colors.blue.withAlpha(30),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12.0),
                          child: Text(user.name),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
      future: users,
    );
  }

  Future<List<User>> fetchUsers() async {
    return await UserApi().getUsers();
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
