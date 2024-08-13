import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/post.dart';
import 'providers.dart';

part 'posts_controller.g.dart';

@riverpod
class PostsController extends _$PostsController {
  @override
  Future<List<Post>> build() => _getAllPosts();

  Future<List<Post>> _getAllPosts() async {
    final repository = ref.read(postsRepositoryProvider);
    final posts = await repository.getAllPosts();

    return posts;
  }

  void toggleLike(int postId) {
    final posts = state.value;
    if (posts == null) {
      return;
    }
    final postIndex = posts.indexWhere(
      (post) => post.id == postId,
    );
    final selectedPost = posts[postIndex];
    final updatedPost = selectedPost.copyWith(
      isLiked: !selectedPost.isLiked,
    );
    final updatedList = [...posts];
    updatedList[postIndex] = updatedPost;

    state = AsyncData(updatedList);
  }
}
