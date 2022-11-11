// ignore_for_file: non_constant_identifier_names

class Model{

}
class Reting{
 
 Professional? professional;
 
}
class Professional {
  int? level;
  int? remaining_score;
  int? score;

  Professional({this.level, this.remaining_score, this.score});

  Professional.fromJson(Map<String, dynamic> json) {
    level = json["level"];
    remaining_score = json["remaining_score"];
    score = json["score"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["level"] = level;
    data["remaining_score"] = remaining_score;
    data["score"] = score;
    return data;
  }
}
class Ethics {
  int? level;
  int? remaining_score;
  int? score;

  Ethics({this.level, this.remaining_score, this.score});

  Ethics.fromJson(Map<String, dynamic> json) {
    level = json["level"];
    remaining_score = json["remaining_score"];
    score = json["score"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["level"] = level;
    data["remaining_score"] = remaining_score;
    data["score"] = score;
    return data;
  }
}

class Subs {
  int? me;
  bool? subscribed;

  Subs({this.me, this.subscribed});

  Subs.fromJson(Map<String, dynamic> json) {
    me = json["me"];
    subscribed = json["subscribed"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["me"] = me;
    data["subscribed"] = subscribed;
    return data;
  }
}

class Category {
  int? id;
  String? slug;
  String? name;
  String? description;
  String? image;
  bool? has_subs;

  Category({
    this.id,
    this.slug,
    this.name,
    this.description,
    this.image,
    this.has_subs,
  });
  Category.fromJson(Map<String,dynamic> json){
    id = json["id"];
    slug = json["slug"];
    name = json["name"];
    description = json["description"];
    image = json["image"];
    has_subs = json["has_subs"];
  }
   
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = id;
    data["slug"] = slug;
    data["name"] = name;
    data["description"] = description;
    data["image"] = image;
    data["has_subs"] = has_subs;
    return data;
  }

}
