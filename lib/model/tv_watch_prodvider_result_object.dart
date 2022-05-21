class TvWatchProviderResultObject {
  TvWatchProviderResultObject({
    required this.id,
    required this.results,
  });

  int id;
  Results results;

  factory TvWatchProviderResultObject.fromJson(Map<String, dynamic> json) =>
      TvWatchProviderResultObject(
        id: json['id'],
        results: Results.fromJson(json['results']),
      );
}

class Results {
  Results({
    this.jp,
  });

  Ae? jp;
  factory Results.fromJson(Map<String, dynamic> json) => Results(
        jp: Ae.fromJson(json['JP']),
      );
}

class Ae {
  Ae({
    this.link,
    this.ads,
    this.flatrate,
    this.rent,
    this.buy,
  });

  String? link;
  List<Ad>? ads;
  List<Ad>? flatrate;
  List<Ad>? rent;
  List<Ad>? buy;

  factory Ae.fromJson(Map<String, dynamic> json) => Ae(
        link: json['link'],
        ads: json['ads'] == null
            ? null
            : List<Ad>.from(json['ads'].map((x) => Ad.fromJson(x))),
        flatrate: json['flatrate'] == null
            ? null
            : List<Ad>.from(json['flatrate'].map((x) => Ad.fromJson(x))),
        rent: json['rent'] == null
            ? null
            : List<Ad>.from(json['rent'].map((x) => Ad.fromJson(x))),
        buy: json['buy'] == null
            ? null
            : List<Ad>.from(json['buy'].map((x) => Ad.fromJson(x))),
      );
}

class Ad {
  Ad({
    this.displayPriority,
    this.logoPath,
    this.providerId,
    this.providerName,
  });

  int? displayPriority;
  String? logoPath;
  int? providerId;
  String? providerName;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        displayPriority: json['display_priority'],
        logoPath: json['logo_path'],
        providerId: json['provider_id'],
        providerName: json['provider_name'],
      );
}
