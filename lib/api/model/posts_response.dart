import 'package:base_api/api/model/base_response.dart';
import 'package:base_api/api/model/post/network_post.dart';

class PostsResponse extends BaseResponse {
  List<NetworkPost> data = List.empty();

  PostsResponse(this.data);

  PostsResponse.mapResponse(Map<String, dynamic> json) {
    data = fromJson(json)!;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return json["data"]
        .map((data) => NetworkPost.fromJson(data))
        .cast<NetworkPost>()
        .toList();
  }
}
