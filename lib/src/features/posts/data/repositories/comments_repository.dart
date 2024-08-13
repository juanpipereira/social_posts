import '../../domain/comment.dart';
import '../data_sources/i_comments_data_source.dart';
import '../mappers/comment_mapper.dart';
import '../requests/get_comments_request.dart';
import 'i_comments_repository.dart';

class CommentsRepository implements ICommentsRepository {
  const CommentsRepository(this.dataSource);

  final ICommentsDataSource dataSource;

  @override
  Future<List<Comment>> getAllComments(int postId) async {
    final response = await dataSource.getAllComments(
      GetCommentsRequest(
        postId,
      ),
    );

    final comments = response
        .map(
          (commentDTO) => commentDTO.toModel(),
        )
        .toList();

    return comments;
  }
}
