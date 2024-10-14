class CurrencyModel {
  Status? status;
  Data? data;

  CurrencyModel({this.status, this.data});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is Map) {
      status = json["status"] == null ? null : Status.fromJson(json["status"]);
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (status != null) {
      _data["status"] = status?.toJson();
    }
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? symbol;
  String? name;
  int? amount;
  String? lastUpdated;
  Quote? quote;

  Data(
      {this.id,
      this.symbol,
      this.name,
      this.amount,
      this.lastUpdated,
      this.quote});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["amount"] is int) {
      amount = json["amount"];
    }
    if (json["last_updated"] is String) {
      lastUpdated = json["last_updated"];
    }
    if (json["quote"] is Map) {
      quote = json["quote"] == null ? null : Quote.fromJson(json["quote"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["symbol"] = symbol;
    _data["name"] = name;
    _data["amount"] = amount;
    _data["last_updated"] = lastUpdated;
    if (quote != null) {
      _data["quote"] = quote?.toJson();
    }
    return _data;
  }
}

class Quote {
  Pkr? pkr;

  Quote({this.pkr});

  Quote.fromJson(Map<String, dynamic> json) {
    if (json["PKR"] is Map) {
      pkr = json["PKR"] == null ? null : Pkr.fromJson(json["PKR"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (pkr != null) {
      _data["PKR"] = pkr?.toJson();
    }
    return _data;
  }
}

class Pkr {
  double? price;
  String? lastUpdated;

  Pkr({this.price, this.lastUpdated});

  Pkr.fromJson(Map<String, dynamic> json) {
    if (json["price"] is double) {
      price = json["price"];
    }
    if (json["last_updated"] is String) {
      lastUpdated = json["last_updated"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["price"] = price;
    _data["last_updated"] = lastUpdated;
    return _data;
  }
}

class Status {
  String? timestamp;
  int? errorCode;
  dynamic errorMessage;
  int? elapsed;
  int? creditCount;
  dynamic notice;

  Status(
      {this.timestamp,
      this.errorCode,
      this.errorMessage,
      this.elapsed,
      this.creditCount,
      this.notice});

  Status.fromJson(Map<String, dynamic> json) {
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
    if (json["error_code"] is int) {
      errorCode = json["error_code"];
    }
    errorMessage = json["error_message"];
    if (json["elapsed"] is int) {
      elapsed = json["elapsed"];
    }
    if (json["credit_count"] is int) {
      creditCount = json["credit_count"];
    }
    notice = json["notice"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["timestamp"] = timestamp;
    _data["error_code"] = errorCode;
    _data["error_message"] = errorMessage;
    _data["elapsed"] = elapsed;
    _data["credit_count"] = creditCount;
    _data["notice"] = notice;
    return _data;
  }
}
