import '../../domain/comment.dart';
import '../dtos/comment_dto.dart';

extension CommentMapper on CommentDTO {
  Comment toModel() => Comment(
        body: body,
        email: email,
        id: id,
        name: name,
        postId: postId,
      );
}
