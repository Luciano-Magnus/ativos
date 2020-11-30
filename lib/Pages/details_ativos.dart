import 'package:ativos/Apis/bovespa.dart';
import 'package:ativos/Apis/mercado_btc.dart';
import 'package:ativos/Components/default_dialog_error.dart';
import 'package:ativos/Components/details_dialog.dart';
import 'package:ativos/Models/BovespaModel.dart';
import 'package:ativos/Models/api_mercado_btc.dart';
import 'package:ativos/Pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsAtivosPage extends StatefulWidget {
  final String codigoAtivo;
  final bool criptomoeda;

  const DetailsAtivosPage({Key key, this.codigoAtivo, this.criptomoeda})
      : super(key: key);

  @override
  _DetailsAtivosPageState createState() => _DetailsAtivosPageState();
}

class _DetailsAtivosPageState extends State<DetailsAtivosPage> {
  double valorAtivo = 0;
  ApiMercadoBtc ticker;
  BovespaModel ativo;
  NumberFormat formatter = NumberFormat("00.00");
  bool carregar = false;
  bool recarregar = true;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    carregaDados();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Ativo - ${widget.codigoAtivo}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Visibility(
                visible: carregar,
                child: InkWell(
                  onTap: () {
                    if(widget.criptomoeda){
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) => DetailsDialog(
                            ticker: ticker,
                          ));
                    }else{
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) => DetailsDialog(
                            ativo: ativo,
                          ));
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      color: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 120.0),
                            child: Text(
                              'R\$ ${formatter.format(valorAtivo)}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if(widget.criptomoeda) {
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (_) =>
                                      DetailsDialog(
                                        ticker: ticker,
                                      ),
                                );
                              }else{
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (_) =>
                                      DetailsDialog(
                                        ativo: ativo,
                                      ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: !carregar,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> carregaDados() async {
    if (recarregar) {
      if (widget.criptomoeda) {
        MercadoBtc mercadoBtc = MercadoBtc();
        ticker = await mercadoBtc.getUrl(widget.codigoAtivo);
        valorAtivo = double.parse(ticker.ticker.buy);
        carregar = true;
        setState(() {});
      } else {
        try {
           ativo =
              await Bovespa().getUrl(widget.codigoAtivo.toUpperCase());
          valorAtivo = double.parse(ativo.papel.ultimo.replaceAll(',', '.'));
          carregar = true;
          setState(() {});
        } catch (e){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => DefaultDialogErros('Erro ao buscar esse ativo'));
        }
      }
      recarregar = false;
    }
  }
}
