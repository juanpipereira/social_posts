import '../dtos/post_dto.dart';

abstract class IPostsDataSource {
  Future<List<PostDTO>> getAllPosts();
}
