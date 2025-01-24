import 'dart:async';
import 'package:flutter/material.dart';

class Stream_builder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: StreamBuilderWidget<int>(
        stream: counterStream(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('Counter: ${snapshot.data}');
          }
        },
      ),
    );
  }

  Stream<int> counterStream() {
    return Stream.periodic(Duration(seconds: 1), (int count) => count);
  }
}

class StreamBuilderWidget<T> extends StatelessWidget {
  final Stream<T> stream;
  final AsyncWidgetBuilder<T> builder;

  const StreamBuilderWidget({
    Key? key,
    required this.stream,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: builder,
    );
  }
}
