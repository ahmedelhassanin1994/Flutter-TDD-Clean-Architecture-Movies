
import 'package:json_annotation/json_annotation.dart';
part 'response_characters.g.dart';



@JsonSerializable()
class Response_Characters{

  @JsonKey(name: "code")
  late int code;
  @JsonKey(name: "status")
  late String status;
  @JsonKey(name: "copyright")
  late String copyright;
  @JsonKey(name: "attributionText")
  late String attributionText;
  @JsonKey(name: "attributionHTML")
  late String attributionHTML;
  @JsonKey(name: "etag")
  late String etag;
  @JsonKey(name: "data")
  late Data_Characters data_characters;

  Response_Characters(
      this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data_characters);


  // factory Response_Characters.fromJson(Map<String,dynamic> json) =>_$Response_CharactersFromJson(json);
  //
  // // to json
  // Map<String,dynamic> tojson() => _$Response_CharactersToJson(this);

  Response_Characters.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data_characters = (json['data'] != null ? new Data_Characters.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['attributionText'] = this.attributionText;
    data['attributionHTML'] = this.attributionHTML;
    data['etag'] = this.etag;
    if (this.data_characters != null) {
      data['data'] = this.data_characters.toJson();
    }
    return data;
  }

}

@JsonSerializable()
class Data_Characters {

  @JsonKey(name: "offset")
  int? offset;
  @JsonKey(name: "limit")
  int? limit;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "results")
  List<Results_Characters>? results;

  Data_Characters(
      this.offset, this.limit, this.total, this.count, this.results);

  Data_Characters.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <Results_Characters>[];
      json['results'].forEach((v) {
        results!.add(new Results_Characters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

@JsonSerializable()
class Results_Characters {

  @JsonKey(name: "id")
  late int id;
  @JsonKey(name: "name")
  late String name;
  @JsonKey(name: "description")
  late String description;
  @JsonKey(name: "modified")
  late String modified;
  @JsonKey(name: "thumbnail")
  late Thumbnail_Characters thumbnail;
  @JsonKey(name: "comics")
  Comics? comics;
  @JsonKey(name: "series")
  Comics? series;
  @JsonKey(name: "stories")
  Comics? stories;
  @JsonKey(name: "events")
  Comics? events;
  @JsonKey(name: "urls")
  List<Urls>? urls;


  Results_Characters(
      this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls);

  Results_Characters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = (json['thumbnail'] != null
        ? new Thumbnail_Characters.fromJson(json['thumbnail'])
        : null)!;
    comics =
    json['comics'] != null ? new Comics.fromJson(json['comics']) : null;
    series =
    json['series'] != null ? new Comics.fromJson(json['series']) : null;
    stories =
    json['stories'] != null ? new Comics.fromJson(json['stories']) : null;
    events =
    json['events'] != null ? new Comics.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }

    if (this.comics != null) {
      data['comics'] = this.comics!.toJson();
    }
    if (this.series != null) {
      data['series'] = this.series!.toJson();
    }
    if (this.stories != null) {
      data['stories'] = this.stories!.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events!.toJson();
    }
    if (this.urls != null) {
      data['urls'] = this.urls!.map((v) => v.toJson()).toList();
    }


    return data;
  }

}

@JsonSerializable()
class Thumbnail_Characters {

  @JsonKey(name: "path")
  late String path;
  @JsonKey(name: "extension")
  late String extension;

  Thumbnail_Characters(this.path, this.extension);

  Thumbnail_Characters.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

@JsonSerializable()
class Comics {
  @JsonKey(name: "available")
  int? available;
  @JsonKey(name: "collectionURI")
  String? collectionURI;
  @JsonKey(name: "items")
  List<Items>? items;
  @JsonKey(name: "returned")
  int? returned;

  Comics({this.available, this.collectionURI, this.items, this.returned});

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}

@JsonSerializable()
class Items {
  @JsonKey(name: "resourceURI")
  String? resourceURI;
  @JsonKey(name: "name")
  String? name;

  Items({this.resourceURI, this.name});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    return data;
  }
}


@JsonSerializable()
class Urls {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "url")
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}