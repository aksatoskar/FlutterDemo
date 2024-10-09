class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({required this.postId, required this.id, required this.name, required this.email, required this.body});

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']
    );
  }

  static List<Comment> fromJsonList(List<dynamic> json) {
    return json.map((obj) => Comment.fromJson(obj)).toList();
  }

}