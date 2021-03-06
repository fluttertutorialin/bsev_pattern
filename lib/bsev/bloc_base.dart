import 'dispatcher.dart';
import 'events_base.dart';
import 'stream_base.dart';
import 'util.dart';

abstract class BlocBase<T extends StreamsBase, E extends EventsBase> {
  T streams;
  dynamic data;
  Dispatcher _dispatcher;
  final String uuid = "${generateId()}-bloc";

  void dispatchView(E event) {
    _dispatcher?.dispatchToView(this, event);
  }

  void dispatchToBloc<T extends BlocBase>(EventsBase event) {
    _dispatcher?.dispatchToBlocs<T>(event);
  }

  void setDispatcher(Dispatcher dispatcher) {
    _dispatcher = dispatcher;
  }

  void initView();

  void eventReceiver(E event);

  void dispose() {
    streams.dispose();
  }
}
