import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:convert/convert.dart';
import 'package:trilhaapp/model/characters_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto/crypto.dart' as crypto;

class MarvelRepository {
  Future<CharactersModel> getCharacters(int offset) async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publickey = dotenv.get("MARVELPUBLICKEY");
    var privatekey = dotenv.get("MARVELAPIKEY");
    var hash = _generateMd5(ts + privatekey + publickey);
    var query = "offset=$offset&ts=$ts&apikey=$publickey&hash=$hash";
    var result =
        await dio.get("http://gateway.marvel.com/v1/public/characters?$query");
    print(result.statusCode);
    var charactersModel = CharactersModel.fromJson(result.data);
    print(charactersModel);
    return charactersModel;
  }

  _generateMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
