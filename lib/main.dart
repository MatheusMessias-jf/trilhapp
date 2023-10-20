import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:trilhaapp/model/tarefa_hive_model.dart';
import 'model/dados_cadastrais_model.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());
  await dotenv.load();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('pt', 'BR'),
        child: const MyApp()),
  );
}
