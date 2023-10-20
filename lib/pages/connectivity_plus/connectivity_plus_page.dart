import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityPlusPage extends StatefulWidget {
  const ConnectivityPlusPage({super.key});

  @override
  State<ConnectivityPlusPage> createState() => _ConnectivityPlusPageState();
}

class _ConnectivityPlusPageState extends State<ConnectivityPlusPage> {
  late StreamSubscription subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      print(result);
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Connectivity"),
      ),
      body: Column(
        children: [
          Container(),
          TextButton(
              onPressed: () async {
                var connectivityResult =
                    await Connectivity().checkConnectivity();
                print(connectivityResult);
              },
              child: const Text("Verificar Conexão"))
        ],
      ),
    ));
  }
}
