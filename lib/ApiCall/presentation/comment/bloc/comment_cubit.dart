import 'package:bloc/bloc.dart';
import 'package:firstflutterapp/ApiCall/data/repository/app_repository.dart';
import 'package:firstflutterapp/ApiCall/domain/model/Comment.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final AppRepository appRepository;

  CommentCubit({required this.appRepository}) : super(CommentInitial());

  Future<void> fetchComments() async {
    emit(CommentLoading());

    try {
      final result = await appRepository.fetchComments();
      emit(CommentLoaded(comments: result));
    } catch(ex) {
      emit(CommentError(message: ex.toString()));
    }
  }
}
