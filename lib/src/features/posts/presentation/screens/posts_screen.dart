import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/posts_controller.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Posts'),
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
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        side: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.body,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Read more',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(Icons.arrow_right_alt_rounded),
                            ],
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                        ],
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                            IconButton(
                              highlightColor: Colors.red.shade100,
                              icon: Icon(
                                item.isLiked
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                ref
                                    .read(postsControllerProvider.notifier)
                                    .toggleLike(item.id);
                              },
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            },
            error: (_, __) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sorry!',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Posts are not available',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Loading posts..',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
