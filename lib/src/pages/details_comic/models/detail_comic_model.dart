class DetailComicModel{

  List<CharacterCreditsModel>? characterCredits;
  List<TeamCreditsModel>? teamCredits;
  String? image;
  List<LocationCreditsModel>? locationCredits;

  DetailComicModel({
    this.characterCredits,
    this.teamCredits,
    this.image,
    this.locationCredits,
  });

  Map<String, dynamic> toMap() => {
    'character_credits' : characterCredits,
    'team_credits' : teamCredits,
    'image' : image,
    'location_credits' : locationCredits,
  };

  DetailComicModel.fromMap(Map snapshot) :
    characterCredits = List<CharacterCreditsModel>.from((snapshot['character_credits'] as List).map((e) => CharacterCreditsModel.fromMap(e))) ,
    teamCredits = List<TeamCreditsModel>.from((snapshot['team_credits'] as List).map((e) => TeamCreditsModel.fromMap(e))),
    image = snapshot['image']['original_url'],
    locationCredits = List<LocationCreditsModel>.from((snapshot['location_credits'] as List).map((e) => LocationCreditsModel.fromMap(e)));

}

class CharacterCreditsModel{

  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;

  CharacterCreditsModel({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  CharacterCreditsModel.fromMap(Map snapshot) :
        apiDetailUrl = snapshot['api_detail_url'],
        id = snapshot['id'],
        name = snapshot['name'],
        siteDetailUrl = snapshot['site_detail_url'];

}

class TeamCreditsModel{

  int? id;
  String? name;

  TeamCreditsModel({
    this.id,
    this.name,
  });

  TeamCreditsModel.fromMap(Map snapshot) :
        id = snapshot['id'],
        name = snapshot['name'];

}

class LocationCreditsModel{

  int? id;
  String? name;

  LocationCreditsModel({
    this.id,
    this.name,
  });

  LocationCreditsModel.fromMap(Map snapshot) :
        id = snapshot['id'],
        name = snapshot['name'];

}