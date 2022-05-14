class TvDetailResultObject {
  TvDetailResultObject({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    required this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    required this.originCountry,
    this.originalLanguage,
    required this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    required this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  DateTime firstAirDate;
  List<Genre>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  DateTime? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  dynamic nextEpisodeToAir;
  List<Network>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String> originCountry;
  String? originalLanguage;
  String originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<Network>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  List<Season> seasons;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  factory TvDetailResultObject.fromJson(Map<String, dynamic> json) => TvDetailResultObject(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    createdBy: List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
    episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
    firstAirDate: DateTime.parse(json["first_air_date"]),
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    inProduction: json["in_production"],
    languages: List<String>.from(json["languages"].map((x) => x)),
    lastAirDate: DateTime.parse(json["last_air_date"]),
    lastEpisodeToAir: LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
    name: json["name"],
    nextEpisodeToAir: json["next_episode_to_air"],
    networks: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
    numberOfEpisodes: json["number_of_episodes"],
    numberOfSeasons: json["number_of_seasons"],
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"],
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: List<Network>.from(json["production_companies"].map((x) => Network.fromJson(x))),
    productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
    seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
    status: json["status"],
    tagline: json["tagline"],
    type: json["type"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  int? id;
  String? creditId;
  String? name;
  int? gender;
  String? profilePath;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    creditId: json["credit_id"],
    name: json["name"],
    gender: json["gender"],
    profilePath: json["profile_path"],
  );
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class LastEpisodeToAir {
  LastEpisodeToAir({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  DateTime? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? seasonNumber;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => LastEpisodeToAir(
    airDate: DateTime.parse(json["air_date"]),
    episodeNumber: json["episode_number"],
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    productionCode: json["production_code"],
    seasonNumber: json["season_number"],
    stillPath: json["still_path"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );
}

class Network {
  Network({
    this.name,
    this.id,
    this.logoPath,
    this.originCountry,
  });

  String? name;
  int? id;
  String? logoPath;
  String? originCountry;

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    name: json["name"],
    id: json["id"],
    logoPath: json["logo_path"],
    originCountry: json["origin_country"],
  );
}

class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  String? iso31661;
  String? name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    iso31661: json["iso_3166_1"],
    name: json["name"],
  );
}

class Season {
  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    required this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  DateTime? airDate;
  int? episodeCount;
  int? id;
  String name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    airDate: json["air_date"] != null ? DateTime.parse(json["air_date"]) : null,
    episodeCount: json["episode_count"],
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    seasonNumber: json["season_number"],
  );
}

class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  String? englishName;
  String? iso6391;
  String? name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    englishName: json["english_name"],
    iso6391: json["iso_639_1"],
    name: json["name"],
  );
}
