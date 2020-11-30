import 'package:ativos/Models/BovespaModel.dart';
import 'package:ativos/Models/api_mercado_btc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsDialog extends StatefulWidget {
  final ApiMercadoBtc ticker;
  final BovespaModel ativo;

  const DetailsDialog({Key key, this.ticker, this.ativo}) : super(key: key);

  @override
  _DetailsDialogState createState() => _DetailsDialogState();
}

class _DetailsDialogState extends State<DetailsDialog> {
  NumberFormat formatter = NumberFormat("00.00");

  String maisAlto = '';
  String abertura = '';
  String maisBaixo = '';
  String atual = '';
  @override
  Widget build(BuildContext context) {
    if(widget.ticker != null){
      maisAlto = formatter.format(double.parse(widget.ticker.ticker.high)).replaceAll('.', ',');
      maisBaixo = formatter.format(double.parse(widget.ticker.ticker.low)).replaceAll('.', ',');
      atual = formatter.format(double.parse(widget.ticker.ticker.buy)).replaceAll('.', ',');
      abertura = formatter.format(double.parse(widget.ticker.ticker.open)).replaceAll('.', ',');
    }else{
      maisAlto = widget.ativo.papel.maximo;
      maisBaixo = widget.ativo.papel.minimo;
      atual = widget.ativo.papel.ultimo;
      abertura = widget.ativo.papel.abertura;
    }
    return AlertDialog(
      title: Text('Ativo'),
      content: Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                child: Card(
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Mais alto R\$ $maisAlto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: Card(
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Mais baixo R\$ $maisBaixo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: Card(
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Atual R\$ $atual',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: Card(
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Abertura R\$ $abertura',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK', style: TextStyle(color: Colors.blueGrey),),
        )
      ],
    );
  }
}
