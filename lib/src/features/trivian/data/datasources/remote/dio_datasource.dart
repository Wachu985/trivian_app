import 'package:dio/dio.dart';
import 'package:trivian_app/src/features/trivian/data/models/trivian_model.dart';
import 'package:trivian_app/src/features/trivian/domain/entities/trivian.dart';

import 'iremote_datasource.dart';

class DioDatasource implements IRemoteDatasource {
  DioDatasource({required Dio client, required String url})
      : _client = client,
        _url = url;
  final Dio _client;
  final String _url;

  @override
  Future<Trivian> getNumber(int number) async {
    try {
      final response = await _client.get('$_url$number/trivia?json');
      if (response.statusCode == 200) {
        return TrivianModel.fromJson(response.data);
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de Conexion');
    }
  }

  @override
  Future<Trivian> getRandom() async {
    try {
      final response = await _client.get('${_url}random/trivia?json');
      if (response.statusCode == 200) {
        return TrivianModel.fromJson(response.data);
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de Conexion');
    }
  }
}
