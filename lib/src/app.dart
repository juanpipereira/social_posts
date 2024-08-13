import 'package:flutter/material.dart';

import 'features/posts/presentation/screens/posts_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Posts',
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
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
