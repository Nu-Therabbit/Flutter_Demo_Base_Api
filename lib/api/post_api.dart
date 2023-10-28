import 'package:base_api/api/base_api_client.dart';
import 'package:base_api/api/model/posts_response.dart';
import 'package:base_api/model/post/network_post_to_post_mapper.dart';
import 'package:base_api/model/post/post.dart';

class PostApi extends BaseApiClient {
  Future<List<Post>> getPosts() async {
    final response = await get(endpoint: 'posts', token: "mock-token-11111");
    final posts = PostsResponse.mapResponse(response.body!)
        .data
        .map((e) => NetworkPostToPostMapper().map(e))
        .toList();
    return posts;
  }

  void createPost() {}
}
