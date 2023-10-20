import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

// ESSA PÁGINA NÃO FUNCIONA CORRETAMENTE NO SIMULADOR DO IOS NO MAC, APENAS DIRETAMENTE EM UM CELULAR FÍSICO
// APARENTEMENTE O PROBLEMA É NO PACOTE BATTERY_PLUS

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  final Battery battery = Battery();
  int percentage = 0;

  @override
  void initState() {
    // TODO: implement initState
    getBatteryPerentage();
    // battery.onBatteryStateChanged.listen((BatteryState state) {
    //   print(state);
    // });
    super.initState();
  }

  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
    percentage = level;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Battery level: ${percentage.toString()}"),
      ),
    ));
  }
}
