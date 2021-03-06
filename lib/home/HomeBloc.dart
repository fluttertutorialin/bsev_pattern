import 'package:bsev_pattern/bsev/bloc_base.dart';
import 'package:bsev_pattern/repository/cripto_repository/CriptoRepository.dart';
import 'package:bsev_pattern/repository/cripto_repository/model/Cripto.dart';

import 'HomeEvents.dart';
import 'HomeStreams.dart';

class HomeBloc extends BlocBase<HomeStreams, HomeEvents> {
  final CriptoRepository api;

  int _page = 0;
  List<Cripto> _list;
  static const limit = 20;

  HomeBloc(this.api);

  @override
  void initView() {
    print("data: $data");
    loadCripyto(false);
  }

  @override
  void eventReceiver(HomeEvents event) {
    if (event is HomeLoad) {
      loadCripyto(false);
    }

    if (event is HomeLoadMore) {
      loadCripyto(true);
    }
  }

  void loadCripyto(bool isMore) {
    if (streams.showProgress.value) {
      return;
    }

    if (isMore) {
      _page++;
    } else {
      _page = 0;
    }

    streams.showProgress.set(true);

    api.load(_page, limit).then((cripto) {
      if (isMore) {
        _list.addAll(cripto);
      } else {
        _list = cripto;
      }

      streams.criptos.set(_list);
      streams.showProgress.set(false);
    }).catchError((error) {
      streams.showProgress.set(false);
      dispatchView(ShowError()..data = "Unable to load information");
    });
  }
}
