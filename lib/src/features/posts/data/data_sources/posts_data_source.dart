import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dtos/post_dto.dart';
import 'i_posts_data_source.dart';

class PostsDataSource implements IPostsDataSource {
  final String getPostsUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<PostDTO>> getAllPosts() async {
    List<PostDTO> posts = [];

    try {
      final response = await http.get(
        Uri.parse(getPostsUrl),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        data.forEach(
          (jsonPost) {
            posts.add(
              PostDTO.fromJson(jsonPost),
            );
          },
        );

        return posts;
      } else {
        throw Exception('Error fetching posts');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
