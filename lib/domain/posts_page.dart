import 'package:flutter/material.dart';
import 'package:newspaper/domain/api_client.dart';
import 'package:newspaper/domain/post.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Posts'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GetChildrenData>>(
        future: fetchPosts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('amigos we have error');
          } else if (snapshot.hasData) {
            return PostList(posts: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({
    super.key,
    required this.posts,
  });

  final List<GetChildrenData> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Image.network(posts[index].thumbnail);
        });
  }
}
