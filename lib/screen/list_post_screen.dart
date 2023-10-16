import 'package:flutter/material.dart';

class ListPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Buat data dummy untuk list post
    final List<Post> posts = [
      Post(
        title: 'Post 1',
        description: 'Description for post 1',
        imageUrl: 'URL_GAMBAR_POST_1',
        profileImageUrl: 'URL_FOTO_PROFIL_USER_1',
      ),
      Post(
        title: 'Post 2',
        description: 'Description for post 2',
        imageUrl: 'URL_GAMBAR_POST_2',
        profileImageUrl: 'URL_FOTO_PROFIL_USER_2',
      ),
      // Tambahkan lebih banyak data post jika diperlukan
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('List Post'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.profileImageUrl),
            ),
            title: Text(post.title),
            subtitle: Text(post.description),
          );
        },
      ),
    );
  }
}

class Post {
  final String title;
  final String description;
  final String imageUrl;
  final String profileImageUrl;

  Post({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.profileImageUrl,
  });
}
