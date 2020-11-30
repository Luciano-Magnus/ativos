class BovespaModel {
  Papel papel;

  BovespaModel({this.papel});

  BovespaModel.fromJson(Map<String, dynamic> json) {
    papel = json['Papel'] != null ? new Papel.fromJson(json['Papel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.papel != null) {
      data['Papel'] = this.papel.toJson();
    }
    return data;
  }
}

class Papel {
  String codigo;
  String nome;
  String ibovespa;
  String data;
  String abertura;
  String minimo;
  String maximo;
  String medio;
  String ultimo;
  String oscilacao;

  Papel(
      {this.codigo,
        this.nome,
        this.ibovespa,
        this.data,
        this.abertura,
        this.minimo,
        this.maximo,
        this.medio,
        this.ultimo,
        this.oscilacao});

  Papel.fromJson(Map<String, dynamic> json) {
    codigo = json['Codigo'];
    nome = json['Nome'];
    ibovespa = json['Ibovespa'];
    data = json['Data'];
    abertura = json['Abertura'];
    minimo = json['Minimo'];
    maximo = json['Maximo'];
    medio = json['Medio'];
    ultimo = json['Ultimo'];
    oscilacao = json['Oscilacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Codigo'] = this.codigo;
    data['Nome'] = this.nome;
    data['Ibovespa'] = this.ibovespa;
    data['Data'] = this.data;
    data['Abertura'] = this.abertura;
    data['Minimo'] = this.minimo;
    data['Maximo'] = this.maximo;
    data['Medio'] = this.medio;
    data['Ultimo'] = this.ultimo;
    data['Oscilacao'] = this.oscilacao;
    return data;
  }
}