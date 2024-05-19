class Countries {
  String? get;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  List<Response>? response;

  Countries(
      {this.get, this.parameters, this.errors, this.results, this.response});

  Countries.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    errors = json['errors'] != null ? List<dynamic>.from(json['errors']) : null;
    results = json['results'];
    response = json['response'] != null
        ? (json['response'] as List).map((i) => Response.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['get'] = get;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    if (errors != null) {
      data['errors'] = errors;
    }
    data['results'] = results;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
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
    data['country'] = country;
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

  Response(
      {this.cases,
      this.continent,
      this.country,
      this.day,
      this.deaths,
      this.population,
      this.tests,
      this.time});

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
    if (cases != null) {
      data['cases'] = cases!.toJson();
    }
    data['continent'] = continent;
    data['country'] = country;
    data['day'] = day;
    if (deaths != null) {
      data['deaths'] = deaths!.toJson();
    }
    data['population'] = population;
    if (tests != null) {
      data['tests'] = tests!.toJson();
    }
    data['time'] = time;
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

  Cases(
      {this.s1MPop,
      this.active,
      this.critical,
      this.newCases,
      this.recovered,
      this.total});

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
    data['1M_pop'] = s1MPop;
    data['active'] = active;
    data['critical'] = critical;
    data['new'] = newCases;
    data['recovered'] = recovered;
    data['total'] = total;
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
    data['1M_pop'] = s1MPop;
    data['new'] = newDeaths;
    data['total'] = total;
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
    data['1M_pop'] = s1MPop;
    data['total'] = total;
    return data;
  }
}
