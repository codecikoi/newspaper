import 'package:flutter/material.dart';
import 'package:newspaper/domain/api_client.dart';
import 'package:newspaper/domain/post.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Posts'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GetChildrenObject>>(
        future: RedditImplementation().getOnlyChilds(),
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

  final List<GetChildrenObject> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return posts[index].data.thumbnail != null &&
                  posts[index].data.thumbnail!.contains(RegExp(r'^https://.*'))
              ? Image.network(
                  posts[index].data.thumbnail!,
                  fit: BoxFit.contain,
                )
              : const Placeholder(
                  child: Center(child: Text('No image')),
                );
        });
  }
}
