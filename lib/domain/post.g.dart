// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPost _$GetPostFromJson(Map<String, dynamic> json) => GetPost(
      GetPostData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPostToJson(GetPost instance) => <String, dynamic>{
      'data': instance.data,
    };

GetPostData _$GetPostDataFromJson(Map<String, dynamic> json) => GetPostData(
      (json['children'] as List<dynamic>)
          .map((e) => GetChildrenObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPostDataToJson(GetPostData instance) =>
    <String, dynamic>{
      'children': instance.children,
    };

GetChildrenObject _$GetChildrenObjectFromJson(Map<String, dynamic> json) =>
    GetChildrenObject(
      GetChildrenData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetChildrenObjectToJson(GetChildrenObject instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetChildrenData _$GetChildrenDataFromJson(Map<String, dynamic> json) =>
    GetChildrenData(
      json['title'] as String,
      json['ups'] as int,
      json['thumbnail'] as String,
      json['selftext'] as String,
    );

Map<String, dynamic> _$GetChildrenDataToJson(GetChildrenData instance) =>
    <String, dynamic>{
      'ups': instance.ups,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'selftext': instance.selftext,
    };
