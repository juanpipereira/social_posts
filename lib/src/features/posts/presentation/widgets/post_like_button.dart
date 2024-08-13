import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/widgets/like_button.dart';
import '../../domain/post.dart';
import '../controllers/posts_controller.dart';

class PostLikeButton extends ConsumerWidget {
  const PostLikeButton(
    this.post, {
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LikeButton(
      isLiked: post.isLiked,
      onPressed: () {
        ref
            .read(
              postsControllerProvider.notifier,
            )
            .toggleLike(post.id);
      },
    );
  }
}
