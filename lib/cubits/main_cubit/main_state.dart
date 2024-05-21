part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class MainLoading extends MainState {}

final class MainSuccess extends MainState {
  MainSuccess(this.notes);

  List<NoteModel> notes;
}

final class MainFailure extends MainState {
  MainFailure(this.errorMessage);

  final String errorMessage;
}
