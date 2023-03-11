import 'package:dartz/dartz.dart';
import 'package:trivian_app/src/features/trivian/domain/entities/trivian.dart';

abstract class ITrivianRepository {
  Future<Either<Exception, Trivian>> getRandom();
  Future<Either<Exception, Trivian>> getNumber(int number);
}
