class Comment {
  final String body;
  final String email;
  final int id;
  final String name;
  final int postId;

  const Comment({
    required this.body,
    required this.email,
    required this.id,
    required this.name,
    required this.postId,
  });

  Comment copyWith({
    String? body,
    String? email,
    int? id,
    String? name,
    int? postId,
  }) =>
      Comment(
        body: body ?? this.body,
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
        postId: postId ?? this.postId,
      );
}
