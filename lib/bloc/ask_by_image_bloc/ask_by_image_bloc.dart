import 'package:bloc/bloc.dart';

part 'ask_by_image_event.dart';
part 'ask_by_image_state.dart';

class AskByImageBloc extends Bloc<AskByImageEvent, AskByImageState> {
  AskByImageBloc() : super(AskByImageInitial()) {
    on<AskByImageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
