import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:trilhaapp/pages/auto_size_text/auto_size_text_page.dart';
import 'package:trilhaapp/pages/battery/battery_page.dart';
import 'package:trilhaapp/pages/botton_bar_page.dart';
import 'package:trilhaapp/pages/characters/characters_page.dart';
import 'package:trilhaapp/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaapp/pages/connectivity_plus/connectivity_plus_page.dart';
import 'package:trilhaapp/pages/geolocator/geolocator_page.dart';
import 'package:trilhaapp/pages/percent_indicator_page.dart';

import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/posts_page.dart';
import 'package:trilhaapp/pages/tarefa_page/tarefa_http_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../pages/dados_cadastrais/dados_cadastrais_hive.dart';
import '../../pages/numeros_aleatorios/numeros_aleatorios_hive_page.dart';

import 'package:intl/date_symbol_data_local.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return SafeArea(
                      child: Wrap(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Camera"),
                            leading: const Icon(Icons.camera_alt),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Galeria"),
                            leading: const Icon(Icons.photo_album_rounded),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                accountName: const Text("Matheus Messias"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("Dados Cadastrais"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DadosCadastraisHive()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.percent),
                      SizedBox(width: 5),
                      Text("Percent Indicator"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PercentIndicatorPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.internetExplorer,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 5),
                      Text("Abrir DIO"),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);
                await launchUrl(Uri.parse('https://dio.me'));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.appStore,
                      ),
                      SizedBox(width: 5),
                      Text("Informações do pacote"),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);

                PackageInfo packageInfo = await PackageInfo.fromPlatform();

                String appName = packageInfo.appName;
                String packageName = packageInfo.packageName;
                String version = packageInfo.version;
                String buildNumber = packageInfo.buildNumber;

                print(appName);
                print(packageName);
                print(version);
                print(buildNumber);

                print(Platform.operatingSystem);
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapLocationDot,
                      ),
                      SizedBox(width: 5),
                      Text("Abrir Google Maps"),
                    ],
                  )),
              onTap: () async {
                await launchUrl(
                    Uri.parse('http://maps.apple.com/?q=Mexican+Restaurant'));
                Navigator.pop(context);
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.wifi,
                      ),
                      SizedBox(width: 5),
                      Text("Conexão"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ConnectivityPlusPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.locationDot,
                      ),
                      SizedBox(width: 5),
                      Text("GPS"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const GeolocatorPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.robot,
                      ),
                      SizedBox(width: 5),
                      Text("Informações do Dispositivo"),
                    ],
                  )),
              onTap: () async {
                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

                if (Platform.isAndroid) {
                  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                  print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
                } else if (Platform.isIOS) {
                  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                  print(
                      'Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
                } else {
                  WebBrowserInfo webBrowserInfo =
                      await deviceInfo.webBrowserInfo;
                  print(
                      'Running on ${webBrowserInfo.userAgent}'); // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"
                }

                Navigator.pop(context);
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.folder,
                      ),
                      SizedBox(width: 5),
                      Text("Path Provider"),
                    ],
                  )),
              onTap: () async {
                var directory = await path_provider.getTemporaryDirectory();
                print(directory);
                Navigator.pop(context);
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.batteryHalf),
                      SizedBox(width: 5),
                      Text("Indicador da Bateria"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BatteryPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.share),
                      SizedBox(width: 5),
                      Text("Compartilhar"),
                    ],
                  )),
              onTap: () {
                Share.share('Olhem esse site que encontrei! https://dio.me');
                Navigator.pop(context);
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.build_circle),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Configurações"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (bc) => const ConfiguracoesHivePage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.text_fields),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Auto Sized Text"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (bc) => const AutoSizeTextPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.vertical_align_bottom_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Botton Bar Page"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (bc) => const BottonBarPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Termos de uso e privecidade"),
                    ],
                  )),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    context: context,
                    builder: (BuildContext bc) {
                      return SafeArea(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          child: const Column(
                            children: [
                              Text(
                                "Termos de Uso e Privacidade",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.numbers),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Gerador de Números"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (bc) => const NumerosAleatoriosHivePage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.podcast,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Posts"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (bc) => const PostsPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.shield_moon),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Heróis"),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (bc) => const CharactersPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.add_task),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Tarefas HTTP"),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (bc) => const TarefaHTTPPage()));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Sair"),
                    ],
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        alignment: Alignment.centerLeft,
                        title: const Text(
                          "APP_TITLE",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ).tr(),
                        content: const Wrap(
                          children: [
                            Text("Deseja realmente sair do aplicativo?")
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Não")),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: const Text("Sim")),
                        ],
                      );
                    });
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.home),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Intl"),
                    ],
                  )),
              onTap: () {
                initializeDateFormatting('en_US');
                var f = NumberFormat('#,###.0#', 'en_US');
                var fBR = NumberFormat('#,###.0#', 'pt_BR');
                print(f.format(12345.345));
                print(fBR.format(12345.345));

                var data = DateTime(2023, 10, 16);
                print(DateFormat('EEEEE', 'en_US').format(data));
                print(DateFormat('EEEEE', 'pt_BR').format(data));
              }),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.flag),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Trocar Idioma"),
                    ],
                  )),
              onTap: () {
                if (context.locale.toString() == "pt_BR") {
                  context.setLocale(Locale('en', 'US'));
                } else {
                  context.setLocale(Locale('pt', 'BR'));
                }
                print(context.locale.toString());
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
