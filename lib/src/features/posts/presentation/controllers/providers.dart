import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/i_posts_data_source.dart';
import '../../data/data_sources/posts_data_source.dart';
import '../../data/repositories/i_posts_repository.dart';
import '../../data/repositories/posts_repository.dart';

part 'providers.g.dart';

@riverpod
IPostsDataSource postsDataSource(PostsDataSourceRef ref) {
  return PostsDataSource();
}

@riverpod
IPostsRepository postsRepository(PostsRepositoryRef ref) {
  final dataSource = ref.watch(postsDataSourceProvider);

  return PostsRepository(dataSource);
}
