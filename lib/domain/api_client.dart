import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newspaper/domain/post.dart';

abstract class IReddit {
  Future<GetPost> getPost();
  Future<List<GetChildrenObject>> getOnlyChilds();
}

class RedditImplementation implements IReddit {
  static String apiUrl = 'https://www.reddit.com/r/flutterdev/new.json';
  final http.Client _client;

  RedditImplementation({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<List<GetChildrenObject>> getOnlyChilds() async {
    try {
      final data$response = await _client.get(Uri.parse(RedditImplementation.apiUrl));
      if (data$response.statusCode == 200) {
        //& simple for example
        //& get data:
        final childLst = json.decode(utf8.decode(data$response.bodyBytes))['data']['children'];
        //& set model
        return List<GetChildrenObject>.from(childLst.map((e) => GetChildrenObject.fromJson(e)));
        //^ or simple:
        // return List<GetChildrenObject>.from(json
        //     .decode(utf8.decode(data$response.bodyBytes))['data']['children']
        //     .map((e) => GetChildrenObject.fromJson(e)));
      } else {
        throw Exception();

        ///change to custom exception
      }
    } on SocketException catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      rethrow;
    } on Object catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      rethrow;
    } finally {
      // ...
    }
  }

  @override
  Future<GetPost> getPost() {
    throw UnimplementedError();
  }
}
