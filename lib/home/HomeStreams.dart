import 'package:bsev_pattern/bsev/stream_base.dart';
import 'package:bsev_pattern/bsev/stream_create.dart';
import 'package:bsev_pattern/repository/cripto_repository/model/Cripto.dart';

class HomeStreams extends StreamsBase {
  var criptos = BehaviorSubjectCreate<List<Cripto>>();
  var showProgress = BehaviorSubjectCreate<bool>(initValue: false);

  @override
  void dispose() {
    criptos.close();
    showProgress.close();
  }
}
