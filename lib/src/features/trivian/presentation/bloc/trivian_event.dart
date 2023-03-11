part of 'trivian_bloc.dart';

abstract class TrivianEvent {
  factory TrivianEvent.getTrivianNumberEvent(int number) =>
      _GetTrivianNumberEvent(number: number);
  factory TrivianEvent.getRandomNumberEvent() => const _GetRandomNumberEvent();
}

class _GetTrivianNumberEvent implements TrivianEvent {
  const _GetTrivianNumberEvent({required this.number});
  final int number;
}

class _GetRandomNumberEvent implements TrivianEvent {
  const _GetRandomNumberEvent();
}
