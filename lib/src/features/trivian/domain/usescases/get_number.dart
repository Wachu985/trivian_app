import 'package:dartz/dartz.dart';
import 'package:trivian_app/src/features/trivian/domain/entities/trivian.dart';
import 'package:trivian_app/src/features/trivian/domain/repositories/itrivian_repository.dart';

class GetNumber {
  GetNumber({required ITrivianRepository repository})
      : _repository = repository;

  final ITrivianRepository _repository;

  Future<Either<Exception, Trivian>> call(int number) async =>
      await _repository.getNumber(number);
}
