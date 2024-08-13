import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dtos/comment_dto.dart';
import '../requests/get_comments_request.dart';
import 'i_comments_data_source.dart';

class CommentsDataSource implements ICommentsDataSource {
  final String getCommentsUrl =
      'https://jsonplaceholder.typicode.com/comments?postId={postId}';

  @override
  Future<List<CommentDTO>> getAllComments(
    GetCommentsRequest request,
  ) async {
    List<CommentDTO> comments = [];

    try {
      final response = await http.get(
        Uri.parse(
          getCommentsUrl.replaceAll(
            '{postId}',
            request.postId.toString(),
          ),
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        data.forEach(
          (jsonComment) {
            comments.add(
              CommentDTO.fromJson(jsonComment),
            );
          },
        );

        return comments;
      } else {
        throw Exception('Error fetching comments');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
