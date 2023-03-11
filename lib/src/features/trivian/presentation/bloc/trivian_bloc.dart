import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/domain.dart' show Trivian, GetNumber, GetRandom;

part 'trivian_event.dart';
part 'trivian_state.dart';

class TrivianBloc extends Bloc<TrivianEvent, TrivianState> {
  TrivianBloc({required GetNumber getNumber, required GetRandom getRandom})
      : _getNumber = getNumber,
        _getRandom = getRandom,
        super(TrivianState.initialState()) {
    //
    on<_GetRandomNumberEvent>(_getRandomNumberEvent);
    on<_GetTrivianNumberEvent>(_getTrivianNumberEvent);
  }
  final GetNumber _getNumber;
  final GetRandom _getRandom;

  // Logica
  FutureOr<void> _getRandomNumberEvent(
      _GetRandomNumberEvent event, Emitter<TrivianState> emit) async {
    emit(state.copyWith(status: TrivianStatus.loading));
    final data = await _getRandom();
    data.fold(
        (error) => emit(state.copyWith(
            error: error.toString(), status: TrivianStatus.error)),
        (trivia) => emit(
            state.copyWith(status: TrivianStatus.success, trivian: trivia)));
  }

  FutureOr<void> _getTrivianNumberEvent(
      _GetTrivianNumberEvent event, Emitter<TrivianState> emit) async {
    emit(state.copyWith(status: TrivianStatus.loading));
    final data = await _getNumber(event.number);
    data.fold(
        (error) => emit(state.copyWith(
            error: error.toString(), status: TrivianStatus.error)),
        (trivia) => emit(
            state.copyWith(status: TrivianStatus.success, trivian: trivia)));
  }
}
