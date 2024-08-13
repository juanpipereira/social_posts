import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/widgets/error_indicator.dart';
import '../../../posts/presentation/controllers/posts_controller.dart';
import '../widgets/comments_list.dart';
import '../widgets/entering_animation.dart';
import '../widgets/post_like_button.dart';

class PostDetailsScreen extends ConsumerWidget {
  const PostDetailsScreen(
    this.postIndex, {
    super.key,
  });

  final int postIndex;

  static const routeName = '/detail';

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final post = ref.watch(
      postsControllerProvider.select(
        (posts) => posts.value?.firstWhere(
          (post) => post.id == postIndex,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: post == null
          ? const ErrorIndicator(
              'The post is not available',
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: EnteringAnimation(
                              child: Text(
                                post.title,
                                style: const TextStyle(fontSize: 24.0),
                              ),
                            ),
                          ),
                          PostLikeButton(post),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      EnteringAnimation(
                        child: Text(
                          post.body,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        'Comments:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
                CommentsList(postIndex),
              ],
            ),
    );
  }
}
