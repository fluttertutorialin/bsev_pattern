import 'package:bsev_pattern/bsev/bsev.dart';
import 'package:flutter/material.dart';

import 'SecondBloc.dart';
import 'SecondEvents.dart';
import 'SecondStreams.dart';

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bsev<SecondBloc, SecondStreams>(
      builder: (_, dispatcher, streams) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Second example"),
          ),
          body: Center(
            child: StreamBuilder(
                stream: streams.count.get,
                builder: (_, snapshot) {
                  var msg = snapshot.hasData ? snapshot.data.toString() : "0";
                  return Text(msg);
                }),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                dispatcher(Increment());
              }),
        );
      },
    );
  }
}
