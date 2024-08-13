class PostDTO {
  const PostDTO({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostDTO.fromJson(Map<String, dynamic> json) => PostDTO(
        body: json["body"],
        id: json["id"],
        title: json["title"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "id": id,
        "title": title,
        "userId": userId,
      };
}
