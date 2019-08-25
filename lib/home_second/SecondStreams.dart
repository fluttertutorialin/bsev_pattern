import 'package:bsev_pattern/bsev/stream_base.dart';
import 'package:bsev_pattern/bsev/stream_create.dart';

class SecondStreams extends StreamsBase {
  var count = BehaviorSubjectCreate<int>();

  @override
  void dispose() {
    count.close();
  }
}
