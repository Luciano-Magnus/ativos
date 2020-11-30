import 'package:ativos/Apis/bovespa.dart';
import 'package:ativos/Components/default_dialog_error.dart';
import 'package:ativos/Models/BovespaModel.dart';
import 'package:ativos/Pages/details_ativos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeAtivoController = TextEditingController();
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lista de ativos',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Ativos',
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Card(
                        color: Colors.blue,
                        child: InkWell(
                          splashColor: Colors.blueGrey,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailsAtivosPage(
                                  codigoAtivo: 'BTC',
                                  criptomoeda: true,
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text('Bitcoin',
                                style: GoogleFonts.alike(
                                  fontSize: 24,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Card(
                        color: Colors.blue,
                        child: InkWell(
                          splashColor: Colors.blueGrey,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailsAtivosPage(
                                  codigoAtivo: 'ETH',
                                  criptomoeda: true,
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text('Ethereum',
                                style: GoogleFonts.alike(
                                  fontSize: 24,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Card(
                        color: Colors.blue,
                        child: InkWell(
                          splashColor: Colors.blueGrey,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailsAtivosPage(
                                  codigoAtivo: 'LTC',
                                  criptomoeda: true,
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text('Litecoin',
                                style: GoogleFonts.alike(
                                  fontSize: 24,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ATIVOS DA BOLSA DE VALORES',
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Form(
                  child: Stack(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Nome do ativo',
                            labelStyle: textStyle,
                            suffix: SizedBox(
                              width: 30,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        controller: nomeAtivoController,
                      ),
                      Visibility(
                        visible: true,
                        child: Align(
                          alignment: Alignment.centerRight,
                          heightFactor: 1.3,
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: () {
                              if (nomeAtivoController.text == '' ||
                                  nomeAtivoController.text == null) {
                                showDialog(
                                    context: context,
                                    builder: (_) => DefaultDialogErros(
                                          'Preencha todos os campos.',
                                          voltar: 1,
                                        ));
                              }else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsAtivosPage(
                                          codigoAtivo: nomeAtivoController.text
                                              .toUpperCase()
                                              .replaceAll(' ', ''),
                                          criptomoeda: false,
                                        ),
                                  ),
                                );
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
