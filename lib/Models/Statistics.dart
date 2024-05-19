class Statistics {
  List<dynamic>? errors;
  String? get;
  Parameters? parameters;
  List<Response>? response;
  int? results;

  Statistics({this.errors, this.get, this.parameters, this.response, this.results});

  Statistics.fromJson(Map<String, dynamic> json) {
    errors = json['errors'] as List<dynamic>?;
    get = json['get'];
    parameters = json['parameters'] != null ? Parameters.fromJson(json['parameters']) : null;
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errors'] = this.errors;
    data['get'] = this.get;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    data['results'] = this.results;
    return data;
  }
}

class Parameters {
  String? country;

  Parameters({this.country});

  Parameters.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = this.country;
    return data;
  }
}

class Response {
  Cases? cases;
  String? continent;
  String? country;
  String? day;
  Deaths? deaths;
  int? population;
  Tests? tests;
  String? time;

  Response({this.cases, this.continent, this.country, this.day, this.deaths, this.population, this.tests, this.time});

  Response.fromJson(Map<String, dynamic> json) {
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    continent = json['continent'];
    country = json['country'];
    day = json['day'];
    deaths = json['deaths'] != null ? Deaths.fromJson(json['deaths']) : null;
    population = json['population'];
    tests = json['tests'] != null ? Tests.fromJson(json['tests']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    data['continent'] = this.continent;
    data['country'] = this.country;
    data['day'] = this.day;
    if (this.deaths != null) {
      data['deaths'] = this.deaths!.toJson();
    }
    data['population'] = this.population;
    if (this.tests != null) {
      data['tests'] = this.tests!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Cases {
  String? s1MPop;
  int? active;
  int? critical;
  String? newCases;
  int? recovered;
  int? total;

  Cases({this.s1MPop, this.active, this.critical, this.newCases, this.recovered, this.total});

  Cases.fromJson(Map<String, dynamic> json) {
    s1MPop = json['1M_pop'];
    active = json['active'];
    critical = json['critical'];
    newCases = json['new'];
    recovered = json['recovered'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1M_pop'] = this.s1MPop;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['new'] = this.newCases;
    data['recovered'] = this.recovered;
    data['total'] = this.total;
    return data;
  }
}

class Deaths {
  String? s1MPop;
  String? newDeaths;
  int? total;

  Deaths({this.s1MPop, this.newDeaths, this.total});

  Deaths.fromJson(Map<String, dynamic> json) {
    s1MPop = json['1M_pop'];
    newDeaths = json['new'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1M_pop'] = this.s1MPop;
    data['new'] = this.newDeaths;
    data['total'] = this.total;
    return data;
  }
}

class Tests {
  String? s1MPop;
  int? total;

  Tests({this.s1MPop, this.total});

  Tests.fromJson(Map<String, dynamic> json) {
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1M_pop'] = this.s1MPop;
    data['total'] = this.total;
    return data;
  }
}
