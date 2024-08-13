import '../../domain/comment.dart';

abstract class ICommentsRepository {
  Future<List<Comment>> getAllComments(int postId);
}
