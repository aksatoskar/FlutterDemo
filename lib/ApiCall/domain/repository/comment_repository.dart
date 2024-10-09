import '../model/Comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> fetchComments();
}