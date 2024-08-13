import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:social_posts/src/features/posts/data/repositories/comments_repository.dart';
import 'package:social_posts/src/features/posts/domain/comment.dart';
import 'package:social_posts/src/features/posts/presentation/controllers/comments_controller.dart';
import 'package:social_posts/src/features/posts/presentation/controllers/providers.dart';

class MockCommentsRepository extends Mock implements CommentsRepository {
  @override
  Future<List<Comment>> getAllComments(int postId) async => [
        Comment(
          id: 1,
          postId: postId,
          body: 'First comment',
          email: 'email',
          name: 'name',
        ),
        Comment(
          id: 2,
          postId: postId,
          body: 'Second comment',
          email: 'email',
          name: 'name',
        ),
      ];
}

void main() {
  late ProviderContainer container;
  late MockCommentsRepository mockCommentsRepository;

  setUp(() {
    mockCommentsRepository = MockCommentsRepository();
    container = ProviderContainer(
      overrides: [
        commentsRepositoryProvider.overrideWithValue(
          mockCommentsRepository,
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CommentsController', () {
    test('should fetch all comments for a given postId', () async {
      const int postId = 1;

      final commentsController =
          container.read(commentsControllerProvider(postId).notifier);
      await commentsController.build(postId);

      final commentsState = container.read(commentsControllerProvider(postId));
      expect(commentsState.value, isNotNull);
      expect(commentsState.value!.length, 2);
      expect(commentsState.value![0].body, 'First comment');
      expect(commentsState.value![1].body, 'Second comment');
    });
  });
}
