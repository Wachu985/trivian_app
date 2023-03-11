part of 'trivian_bloc.dart';

enum TrivianStatus { initial, loading, error, success }

class TrivianState extends Equatable {
  const TrivianState(
      {this.status = TrivianStatus.initial, this.error = '', this.trivian});

  final TrivianStatus status;
  final String error;
  final Trivian? trivian;

  factory TrivianState.initialState() => const TrivianState();

  TrivianState copyWith(
          {TrivianStatus? status, String? error, Trivian? trivian}) =>
      TrivianState(
          error: error ?? this.error,
          status: status ?? this.status,
          trivian: trivian ?? this.trivian);

  @override
  List<Object> get props => [status, error, trivian ?? Object()];
}
