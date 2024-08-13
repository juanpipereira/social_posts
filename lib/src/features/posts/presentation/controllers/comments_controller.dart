import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/comment.dart';
import 'providers.dart';

part 'comments_controller.g.dart';

@riverpod
class CommentsController extends _$CommentsController {
  @override
  Future<List<Comment>> build(int postId) => _getAllComments(postId);

  Future<List<Comment>> _getAllComments(int postId) async {
    final repository = ref.read(commentsRepositoryProvider);
    final comments = await repository.getAllComments(postId);

    return comments;
  }
}
