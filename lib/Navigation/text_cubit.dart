import 'package:flutter_bloc/flutter_bloc.dart';

class TextCubit extends Cubit<String> {
  TextCubit() : super(''); // Initial state is an empty string

  // Function to update the text
  void updateText(String newText) {
    emit(newText);
  }
}