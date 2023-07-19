class ComicModel{

  String? name;
  String? issueNumber;
  String? image;
  String? dateAdded;
  String? apiDetailUrl;

  ComicModel({
    this.name,
    this.issueNumber,
    this.image,
    this.dateAdded,
    this.apiDetailUrl,
  });

  Map<String, dynamic> toMap() => {
    'name' : name,
    'issue_number' : issueNumber,
    'image' : image,
    'date_added' : dateAdded,
    'api_detail_url' : apiDetailUrl,
  };

  ComicModel.fromMap(Map snapshot) :
    name = snapshot['name'],
    issueNumber = snapshot['issue_number'],
    image = snapshot['image']['original_url'],
    dateAdded = snapshot['date_added'],
    apiDetailUrl = snapshot['api_detail_url'];

}