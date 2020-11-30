import 'package:ativos/Models/api_mercado_btc.dart';
import 'package:dio/dio.dart';

class MercadoBtc {
  Future<ApiMercadoBtc> getUrl(String codigo) async{
    var btc = await Dio().get('https://www.mercadobitcoin.net/api/$codigo/ticker/').then(
          (res) => ApiMercadoBtc.fromJson(res.data),
        );
    return btc;
  }
}
