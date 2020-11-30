import 'package:flutter/material.dart';

class DefaultDialogErros extends StatefulWidget {
  final String message;
  final int voltar;

  const DefaultDialogErros(this.message,{Key key, this.voltar}) : super(key: key);
  @override
  _DefaultDialogErrosState createState() => _DefaultDialogErrosState();
}

class _DefaultDialogErrosState extends State<DefaultDialogErros> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: AlertDialog(
        title: Text('ERRO'),
        content: Container(
          height: 50,
          child: Center(
            child: Text(widget.message),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              if(widget.voltar == null) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }else{
                Navigator.of(context).pop();
              }
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
        ],
      ),
    );
  }
}
