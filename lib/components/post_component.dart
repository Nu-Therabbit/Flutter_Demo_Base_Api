import 'package:base_api/model/post/post.dart';
import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  const PostComponent({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 12, right: 12),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue.withAlpha(30),
        child: Card(
          elevation: 4,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            child: Text(post.title),
          ),
        ),
      ),
    );
  }
}
