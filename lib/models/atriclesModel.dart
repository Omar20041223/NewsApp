class ArticelModel{
  final String title;
  final String? description;
  final String? image;

  ArticelModel({required this.title, required this.description, required this.image});

  factory ArticelModel.fromJson(json){
    return ArticelModel(title: json["title"], description: json["description"], image: json["urlToImage"]);
  }

}