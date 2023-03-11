import '../../../domain/domain.dart' show Trivian;

abstract class IRemoteDatasource {
  Future<Trivian> getNumber(int number);
  Future<Trivian> getRandom();
}
