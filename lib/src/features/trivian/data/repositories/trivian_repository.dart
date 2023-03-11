import 'package:trivian_app/src/features/trivian/data/datasources/remote/iremote_datasource.dart';
import 'package:trivian_app/src/features/trivian/domain/entities/trivian.dart';

import 'package:dartz/dartz.dart';

import '../../domain/domain.dart' show ITrivianRepository;

class TrivianRepository implements ITrivianRepository {
  TrivianRepository({required IRemoteDatasource datasource})
      : _datasource = datasource;

  final IRemoteDatasource _datasource;

  @override
  Future<Either<Exception, Trivian>> getNumber(int number) async {
    try {
      final response = await _datasource.getNumber(number);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Trivian>> getRandom() async {
    try {
      final response = await _datasource.getRandom();
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
