import 'package:base_api/api/model/post/network_post.dart';
import 'package:base_api/common/mapper.dart';
import 'package:base_api/model/post/post.dart';

class NetworkPostToPostMapper extends Mapper<NetworkPost, Post> {
  @override
  Post map(NetworkPost from) {
    return Post(
      userId: from.userId,
      id: from.id,
      title: from.title != null ? from.title! : "",
      body: from.body != null ? from.body! : "",
    );
  }
}
