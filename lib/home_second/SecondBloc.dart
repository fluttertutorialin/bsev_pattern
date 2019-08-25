import 'package:bsev_pattern/bsev/bloc_base.dart';
import 'package:bsev_pattern/bsev/events_base.dart';

import 'SecondEvents.dart';
import 'SecondStreams.dart';

class SecondBloc extends BlocBase<SecondStreams, EventsBase> {
  int count = 0;

  @override
  void eventReceiver(EventsBase event) {
    if (event is Increment) {
      count++;
      streams.count.set(count);
    }
  }

  @override
  void initView() {}
}
