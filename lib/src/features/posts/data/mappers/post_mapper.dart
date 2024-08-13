import '../../domain/post.dart';
import '../dtos/post_dto.dart';

extension PostMapper on PostDTO {
  Post toModel() => Post(
        userId: userId,
        id: id,
        title: title,
        body: body,
      );
}
