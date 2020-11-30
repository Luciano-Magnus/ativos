class ApiMercadoBtc {
  Ticker ticker;

  ApiMercadoBtc({this.ticker});

  ApiMercadoBtc.fromJson(Map<String, dynamic> json) {
    ticker =
    json['ticker'] != null ? new Ticker.fromJson(json['ticker']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ticker != null) {
      data['ticker'] = this.ticker.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ApiMercadoBtc{ticker: $ticker}';
  }
}

class Ticker {
  String high;
  String low;
  String vol;
  String last;
  String buy;
  String sell;
  String open;
  int date;

  Ticker(
      {this.high,
        this.low,
        this.vol,
        this.last,
        this.buy,
        this.sell,
        this.open,
        this.date});

  Ticker.fromJson(Map<String, dynamic> json) {
    high = json['high'];
    low = json['low'];
    vol = json['vol'];
    last = json['last'];
    buy = json['buy'];
    sell = json['sell'];
    open = json['open'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['high'] = this.high;
    data['low'] = this.low;
    data['vol'] = this.vol;
    data['last'] = this.last;
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    data['open'] = this.open;
    data['date'] = this.date;
    return data;
  }

  @override
  String toString() {
    return 'Ticker{high: $high, low: $low, vol: $vol, last: $last, buy: $buy, sell: $sell, open: $open, date: $date}';
  }
}