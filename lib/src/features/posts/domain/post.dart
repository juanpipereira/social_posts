class Post {
  const Post({
    required this.body,
    required this.id,
    this.isLiked = false,
    required this.title,
    required this.userId,
  });

  final String body;
  final int id;
  final bool isLiked;
  final String title;
  final int userId;

  Post copyWith({
    String? body,
    int? id,
    bool? isLiked,
    String? title,
    int? userId,
  }) =>
      Post(
        body: body ?? this.body,
        id: id ?? this.id,
        isLiked: isLiked ?? this.isLiked,
        title: title ?? this.title,
        userId: userId ?? this.userId,
      );
}
