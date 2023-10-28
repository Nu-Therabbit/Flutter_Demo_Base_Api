import 'package:base_api/api/marvel_api.dart';
import 'package:base_api/api/post_api.dart';
import 'package:base_api/components/post_component.dart';
import 'package:base_api/model/post/post.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    posts = fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Center(
        child: postListWidget(),
      ),
    );
  }

  Widget postListWidget() {
    return FutureBuilder<List<Post>>(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Post post = snapshot.data![index];
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  PostComponent(post: post),
                ],
              );
            },
          );
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Post>> fetchPosts() async {
    MarvelApi().getCharacters();
    return await PostApi().getPosts();
  }
}
