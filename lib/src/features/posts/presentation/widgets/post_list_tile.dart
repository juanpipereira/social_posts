import 'package:flutter/material.dart';

import '../../domain/post.dart';
import '../screens/post_details_screen.dart';
import 'post_like_button.dart';

class PostListTile extends StatelessWidget {
  const PostListTile({
    super.key,
    required this.item,
  });

  final Post item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1.2,
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
            PostLikeButton(item),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          PostDetailsScreen.routeName,
          arguments: item.id,
        );
      },
    );
  }
}
