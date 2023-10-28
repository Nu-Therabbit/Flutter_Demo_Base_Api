// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPost _$NetworkPostFromJson(Map<String, dynamic> json) {
  return NetworkPost(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String?,
    body: json['body'] as String?,
  );
}

Map<String, dynamic> _$NetworkPostToJson(NetworkPost instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
