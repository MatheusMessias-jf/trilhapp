import 'package:flutter/material.dart';

import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/repositories/via_cep_repository.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viacepModel = ViaCepModel();
  var viaCEPRepository = ViaCepRepository();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(children: [
            const Text(
              "Consulta de CEP",
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              onChanged: (String value) async {
                var cep = value.trim().replaceAll(RegExp(r'[^0-9]'), '');
                print(cep);
                if (value.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viacepModel = await viaCEPRepository.consultarCEP(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              viacepModel.logradouro ?? "",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
              style: TextStyle(fontSize: 22),
            ),
            Visibility(visible: loading, child: CircularProgressIndicator())
          ])),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {},
      ),
    ));
  }
}
