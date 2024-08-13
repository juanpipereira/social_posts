import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_posts/src/features/posts/data/repositories/posts_repository.dart';
import 'package:social_posts/src/features/posts/domain/post.dart';
import 'package:social_posts/src/features/posts/presentation/controllers/posts_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:social_posts/src/features/posts/presentation/controllers/providers.dart';

class MockPostsRepository extends Mock implements PostsRepository {
  @override
  Future<List<Post>> getAllPosts() async => [
        const Post(
          id: 1,
          isLiked: false,
          body: '',
          title: '',
          userId: 1,
        ),
      ];
}

void main() {
  late ProviderContainer container;
  late PostsController postsController;
  late MockPostsRepository mockPostsRepository;

  setUp(() {
    mockPostsRepository = MockPostsRepository();
    container = ProviderContainer(
      overrides: [
        postsRepositoryProvider.overrideWithValue(mockPostsRepository),
        postsControllerProvider.overrideWith(
          () => PostsController(),
        ),
      ],
    );

    postsController = container.read(postsControllerProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('PostsController', () {
    test('should fetch all posts correctly', () async {
      await postsController.build();

      expect(postsController.state.value!, isNotNull);
      expect(postsController.state.value!.length, 1);
      expect(postsController.state.value![0].id, 1);
    });

    test('should toggle the like status of a post', () async {
      postsController.state = const AsyncData(
        [
          Post(
            id: 1,
            isLiked: false,
            body: '',
            title: '',
            userId: 1,
          ),
        ],
      );

      postsController.toggleLike(1);

      expect(postsController.state.value![0].isLiked, true);
    });
  });
}
