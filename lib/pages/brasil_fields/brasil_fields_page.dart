import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var controllerCep = TextEditingController();
  var controllerCpf = TextEditingController();
  var controllerCentavos = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("CEP"),
          TextFormField(
            controller: controllerCep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              // obrigatório
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("CPF"),
          TextFormField(
            controller: controllerCpf,
            keyboardType: TextInputType.number,
            inputFormatters: [
              // obrigatório
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    print(CPFValidator.isValid(controllerCpf.text));
                  },
                  child: const Text("Continuar"))),
          const Text("Centavos"),
          TextFormField(
            controller: controllerCentavos,
            keyboardType: TextInputType.number,
            inputFormatters: [
              // obrigatório
              FilteringTextInputFormatter.digitsOnly,
              CentavosInputFormatter(moeda: true),
            ],
          )
        ]),
      ),
    );
  }
}
