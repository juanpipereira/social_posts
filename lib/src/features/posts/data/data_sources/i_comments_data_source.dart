import '../dtos/comment_dto.dart';
import '../requests/get_comments_request.dart';

abstract class ICommentsDataSource {
  Future<List<CommentDTO>> getAllComments(
    GetCommentsRequest request,
  );
}
