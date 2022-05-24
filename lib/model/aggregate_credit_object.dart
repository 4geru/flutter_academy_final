class AggregateCreditObject {
  AggregateCreditObject({this.casts, this.crews, this.id});

  AggregateCreditObject.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      casts = <Cast>[];
      json['cast'].forEach((v) {
        casts!.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crews = <Crew>[];
      json['crew'].forEach((v) {
        crews!.add(Crew.fromJson(v));
      });
    }
    id = json['id'];
  }
  List<Cast>? casts;
  List<Crew>? crews;
  int? id;
}

class Cast {
  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.roles,
      this.totalEpisodeCount,
      this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    totalEpisodeCount = json['total_episode_count'];
    order = json['order'];
  }
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<Roles>? roles;
  int? totalEpisodeCount;
  int? order;
}

class Roles {
  Roles({this.creditId, this.character, this.episodeCount});

  Roles.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    character = json['character'];
    episodeCount = json['episode_count'];
  }
  String? creditId;
  String? character;
  int? episodeCount;
}

class Crew {
  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.jobs,
      this.department,
      this.totalEpisodeCount});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(Jobs.fromJson(v));
      });
    }
    department = json['department'];
    totalEpisodeCount = json['total_episode_count'];
  }
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<Jobs>? jobs;
  String? department;
  int? totalEpisodeCount;
}

class Jobs {
  Jobs({this.creditId, this.job, this.episodeCount});

  Jobs.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    job = json['job'];
    episodeCount = json['episode_count'];
  }
  String? creditId;
  String? job;
  int? episodeCount;
}
