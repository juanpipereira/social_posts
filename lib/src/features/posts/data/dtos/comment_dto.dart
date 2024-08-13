class CommentDTO {
  final String body;
  final String email;
  final int id;
  final String name;
  final int postId;

  const CommentDTO({
    required this.body,
    required this.email,
    required this.id,
    required this.name,
    required this.postId,
  });

  factory CommentDTO.fromJson(Map<String, dynamic> json) => CommentDTO(
        body: json["body"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
        postId: json["postId"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "email": email,
        "id": id,
        "name": name,
        "postId": postId,
      };
}
