import '../../domain/post.dart';

abstract class IPostsRepository {
  Future<List<Post>> getAllPosts();
}
