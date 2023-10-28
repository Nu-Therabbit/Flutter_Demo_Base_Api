import 'package:json_annotation/json_annotation.dart';

part 'network_post.g.dart';

@JsonSerializable()
class NetworkPost {
  NetworkPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "body")
  String? body;

  factory NetworkPost.fromJson(Map<String, dynamic> json) =>
      _$NetworkPostFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPostToJson(this);
}
