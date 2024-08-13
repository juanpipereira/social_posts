import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/widgets/error_indicator.dart';
import '../../../core/presentation/widgets/loading_indicator.dart';
import '../controllers/comments_controller.dart';
import 'comment_item.dart';

class CommentsList extends ConsumerWidget {
  const CommentsList(
    this.postId, {
    super.key,
  });

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsResult = ref.watch(
      commentsControllerProvider(
        postId,
      ),
    );

    return Expanded(
      child: commentsResult.when(
        data: (comments) => ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: ListView.separated(
              itemCount: comments.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final selectedComment = comments[index];

                return CommentItem(selectedComment);
              },
            ),
          ),
        ),
        error: (_, __) {
          return ColoredBox(
            color: Theme.of(context).secondaryHeaderColor,
            child: const ErrorIndicator(
              'Comments are not available',
            ),
          );
        },
        loading: () {
          return ColoredBox(
            color: Theme.of(context).secondaryHeaderColor,
            child: const LoadingIndicator(
              'Loading comments..',
            ),
          );
        },
      ),
    );
  }
}
