import 'package:bsev_pattern/support/conection/_con.dart';
import 'model/Cripto.dart';

abstract class CriptoRepository {
  Future<List<Cripto>> load(int page, int limit);
}

class CriptoRepositoryImpl implements CriptoRepository {
  final Con _con;

  CriptoRepositoryImpl(this._con);

  @override
  Future<List<Cripto>> load(int page, int limit) async {
    List response = await _con.get("?convert=BRL&start=$page&limit=$limit");
    return response.map<Cripto>((i) => Cripto.fromJson(i)).toList();
  }
}
