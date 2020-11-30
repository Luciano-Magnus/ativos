import 'dart:convert';
import 'dart:convert';

import 'package:ativos/Models/BovespaModel.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class Bovespa {
  Future<BovespaModel> getUrl(String codigo) async {
    print(codigo);
    var res = await Dio(BaseOptions(
      connectTimeout: 4000,
    )).get(
        'http://bvmf.bmfbovespa.com.br/cotacoes2000/FormConsultaCotacoes.asp?strListaCodigos=$codigo').then((res){
            var xmlParse = Xml2Json();
            xmlParse.parse(res.data);
            return xmlParse.toBadgerfish();
    });
    var substringJson = res.substring(24, res.length-1).replaceAll('@', '');
    var json = jsonDecode(substringJson);
     var ativo = BovespaModel.fromJson(json);
     return ativo;
  }
}
