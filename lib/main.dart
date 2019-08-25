import 'package:injector/injector.dart';

import 'bsev/flavors.dart';
import 'di/InjectBloc.dart';
import 'di/InjectRepository.dart';
import 'home/HomeView.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    Flavors.configure(Flavor.PROD);

    var injector = Injector.appInstance;
    injectBloc(injector);
    injectRepository(injector);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
