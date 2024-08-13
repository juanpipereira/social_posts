import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/widgets/error_indicator.dart';
import '../../../core/presentation/widgets/loading_indicator.dart';
import '../controllers/posts_controller.dart';
import '../widgets/post_list_tile.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: const Text('Social Posts'),
        scrolledUnderElevation: 0.0,
      ),
      body: Consumer(
        builder: (_, ref, __) {
          final postsResponse = ref.watch(postsControllerProvider);

          return postsResponse.when(
            data: (posts) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = posts[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 16.0,
                    ),
                    child: PostListTile(item: item),
                  );
                },
              );
            },
            error: (_, __) => const ErrorIndicator(
              'Posts are not available',
            ),
            loading: () => const LoadingIndicator(
              'Loading posts..',
            ),
          );
        },
      ),
    );
  }
}
