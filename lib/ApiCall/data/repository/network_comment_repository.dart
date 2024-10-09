import 'package:firstflutterapp/ApiCall/domain/model/Comment.dart';
import 'package:firstflutterapp/ApiCall/domain/repository/comment_repository.dart';
import 'api_service.dart';

class NetworkCommentRepository implements CommentRepository {
  ApiService apiService;

  NetworkCommentRepository({required this.apiService});

  @override
  Future<List<Comment>> fetchComments() {
    return apiService.fetchComments();
  }
}