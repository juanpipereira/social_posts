import 'package:flutter/material.dart';

import 'features/posts/presentation/screens/post_details_screen.dart';
import 'features/posts/presentation/screens/posts_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
        ),
      ),
      title: 'Social Posts',
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case PostDetailsScreen.routeName:
                final postIndex =
                    ModalRoute.of(context)!.settings.arguments as int;

                return PostDetailsScreen(
                  postIndex,
                );
              case PostsScreen.routeName:
              default:
                return const PostsScreen();
            }
          },
        );
      },
    );
  }
}
