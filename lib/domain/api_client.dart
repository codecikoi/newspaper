import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newspaper/domain/post.dart';

List<GetChildrenData> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<GetChildrenData>((json) => GetChildrenData.fromJson(json))
      .toList();
}

Future<List<GetChildrenData>> fetchPosts(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://www.reddit.com/r/flutterdev/new.json'));

  return compute(parsePosts, response.body);
}
