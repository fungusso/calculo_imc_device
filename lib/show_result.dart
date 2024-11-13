import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  ShowResult({super.key});

  late String message;

  @override
  Widget build(BuildContext context) {
    message = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Resultado'),
        ),
        body: Center(
          child: Text(message),
        )
    );
  }
}