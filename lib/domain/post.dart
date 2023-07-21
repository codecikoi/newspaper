import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class GetPost {
  final GetPostData data;

  GetPost(this.data);

  factory GetPost.fromJson(Map<String, dynamic> json) =>
      _$GetPostFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostToJson(this);
}

@JsonSerializable()
class GetPostData {
  final List<GetChildrenObject> children;

  GetPostData(this.children);

  factory GetPostData.fromJson(Map<String, dynamic> json) =>
      _$GetPostDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostDataToJson(this);
}

@JsonSerializable()
class GetChildrenObject {
  final GetChildrenData data;

  GetChildrenObject(this.data);

  factory GetChildrenObject.fromJson(Map<String, dynamic> json) =>
      _$GetChildrenObjectFromJson(json);

  Map<String, dynamic> toJson() => _$GetChildrenObjectToJson(this);
}

@JsonSerializable()
class GetChildrenData {
  final int ups;
  final String thumbnail;
  final String title;
  final String selftext;

  GetChildrenData(
    this.title,
    this.ups,
    this.thumbnail,
    this.selftext,
  );

  factory GetChildrenData.fromJson(Map<String, dynamic> json) =>
      _$GetChildrenDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetChildrenDataToJson(this);
}
