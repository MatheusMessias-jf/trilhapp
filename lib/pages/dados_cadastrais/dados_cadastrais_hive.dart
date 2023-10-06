import 'package:flutter/material.dart';

import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

import '../../model/dados_cadastrais_model.dart';

class DadosCadastraisHive extends StatefulWidget {
  const DadosCadastraisHive({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisHive> createState() => _DadosCadastraisHiveState();
}

class _DadosCadastraisHiveState extends State<DadosCadastraisHive> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");

  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItems(int quantidadeMaxima) {
    var items = <DropdownMenuItem<int>>[];
    for (var i = 0; i < quantidadeMaxima; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text((i).toString()),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(
                    texto: "Nome",
                  ),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(
                    texto: "Data de Nascimento",
                  ),
                  TextField(
                    controller: dataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2023, 10, 23));
                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dadosCadastraisModel.dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(
                    texto: "Nível de Experiência",
                  ),
                  Column(
                      children: niveis
                          .map(
                            (nivel) => RadioListTile(
                                title: Text(nivel.toString()),
                                selected:
                                    dadosCadastraisModel.nivelExperiencia ==
                                        nivel,
                                value: nivel,
                                groupValue:
                                    dadosCadastraisModel.nivelExperiencia,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    dadosCadastraisModel.nivelExperiencia =
                                        value.toString();
                                  });
                                }),
                          )
                          .toList()),
                  const TextLabel(texto: "Linguagens Preferidas"),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            title: Text(linguagem),
                            value: dadosCadastraisModel.linguagens
                                .contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  dadosCadastraisModel.linguagens
                                      .add(linguagem);
                                });
                              } else {
                                setState(() {
                                  dadosCadastraisModel.linguagens
                                      .remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de experiência"),
                  DropdownButton(
                      value: dadosCadastraisModel.tempoExperiencia,
                      isExpanded: true,
                      items: returnItems(50),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.tempoExperiencia =
                              int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretenção Salarial R\$ ${dadosCadastraisModel.salario?.round()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: dadosCadastraisModel.salario ?? 0,
                      onChanged: (double value) {
                        setState(() {
                          dadosCadastraisModel.salario = value;
                        });
                      }),
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("O nome deve ser preenchido")));
                          return;
                        }
                        if (dadosCadastraisModel.dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Data de nascimento inválida")));
                          return;
                        }
                        if (dadosCadastraisModel.nivelExperiencia == null ||
                            dadosCadastraisModel.nivelExperiencia!.trim() ==
                                "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nível deve ser selecionado")));
                          return;
                        }
                        if (dadosCadastraisModel.linguagens.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ser selecionado ao menos uma linguagem")));
                          return;
                        }
                        if (dadosCadastraisModel.tempoExperiencia == 0 ||
                            dadosCadastraisModel.tempoExperiencia == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Deve ter ao menos um ano de experiência")));
                          return;
                        }
                        if (dadosCadastraisModel.salario == 0 ||
                            dadosCadastraisModel.salario == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretenção salarial deve ser maior que zero")));
                          return;
                        }
                        dadosCadastraisModel.nome = nomeController.text;
                        dadosCadastraisRepository.salvar(dadosCadastraisModel);
                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvos com sucesso!")));
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
