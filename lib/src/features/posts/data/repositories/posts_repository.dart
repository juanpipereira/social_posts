import '../../domain/post.dart';
import '../mappers/post_mapper.dart';
import '../data_sources/i_posts_data_source.dart';
import 'i_posts_repository.dart';

class PostsRepository implements IPostsRepository {
  const PostsRepository(this.dataSource);

  final IPostsDataSource dataSource;

  @override
  Future<List<Post>> getAllPosts() async {
    final response = await dataSource.getAllPosts();

    final posts = response
        .map(
          (postDTO) => postDTO.toModel(),
        )
        .toList();

    return posts;
  }
}
