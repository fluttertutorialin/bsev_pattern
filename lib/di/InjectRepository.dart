import 'package:bsev_pattern/bsev/flavors.dart';
import 'package:bsev_pattern/repository/cripto_repository/CriptoRepository.dart';
import 'package:bsev_pattern/support/conection/_con.dart';
import 'package:injector/injector.dart';

injectRepository(Injector injector) {
  injector.registerDependency<CriptoRepository>(
      (i) => CriptoRepositoryImpl(i.getDependency()));

  injector.registerDependency<Con>((i) {
    String url;

    switch (Flavors().getFlavor()) {
      case Flavor.PROD:
        url = "https://api.coinmarketcap.com/v1/ticker/";
        break;
      case Flavor.HOMOLOG:
        url = "https://api.coinmarketcap.com/v1/ticker/";
        break;
      case Flavor.DEBUG:
        url = "https://api.coinmarketcap.com/v1/ticker/";
        break;
    }

    return Api(url);
  });
}
