
class SliderObject{
  late String tittle;
  late String subTittle;
  late String image;

  SliderObject(this.tittle, this.subTittle, this.image);
}

class Auth{
 late String? data;
 late String? message;
 late bool? status;

 Auth(this.data, this.message, this.status);
}

// Characters

class ModelCharacters{
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
 late DataCharacters data_characters;

  ModelCharacters(this.code, this.status, this.copyright, this.attributionText,
      this.attributionHTML, this.etag, this.data_characters);
}

class DataCharacters {

  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ResultsCharacters>? results;

  DataCharacters(this.offset, this.limit, this.total, this.count, this.results);
}

class ResultsCharacters {

  int? id;
  String? name;
  String? description;
  String? modified;
  ThumbnailCharacters? thumbnail;
  Comics_? comics;
  Comics_? series;
  Comics_? stories;
  Comics_? events;
  List<Urls_>? urls;

  ResultsCharacters(
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
}

class ThumbnailCharacters {

 late String path;
 late String extension;

  ThumbnailCharacters(this.path, this.extension);
}
class Comics_ {
  int? available;
  String? collectionURI;
  List<Items_>? items;
  int? returned;

  Comics_(this.available, this.collectionURI, this.items, this.returned);
}

class Items_ {
  String? resourceURI;
  String? name;

  Items_(this.resourceURI, this.name);

}

class Urls_ {
  String? type;
  String? url;

  Urls_(this.type, this.url);
}