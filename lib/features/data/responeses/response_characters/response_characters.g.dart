// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response_Characters _$Response_CharactersFromJson(Map<String, dynamic> json) =>
    Response_Characters(
      json['code'] as int,
      json['status'] as String,
      json['copyright'] as String,
      json['attributionText'] as String,
      json['attributionHTML'] as String,
      json['etag'] as String,
      Data_Characters.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Response_CharactersToJson(
        Response_Characters instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'copyright': instance.copyright,
      'attributionText': instance.attributionText,
      'attributionHTML': instance.attributionHTML,
      'etag': instance.etag,
      'data': instance.data_characters,
    };

Data_Characters _$Data_CharactersFromJson(Map<String, dynamic> json) =>
    Data_Characters(
      json['offset'] as int?,
      json['limit'] as int?,
      json['total'] as int?,
      json['count'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => Results_Characters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Data_CharactersToJson(Data_Characters instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.results,
    };

Results_Characters _$Results_CharactersFromJson(Map<String, dynamic> json) =>
    Results_Characters(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['modified'] as String,
      Thumbnail_Characters.fromJson(json['thumbnail'] as Map<String, dynamic>),
      json['comics'] == null
          ? null
          : Comics.fromJson(json['comics'] as Map<String, dynamic>),
      json['series'] == null
          ? null
          : Comics.fromJson(json['series'] as Map<String, dynamic>),
      json['stories'] == null
          ? null
          : Comics.fromJson(json['stories'] as Map<String, dynamic>),
      json['events'] == null
          ? null
          : Comics.fromJson(json['events'] as Map<String, dynamic>),
      (json['urls'] as List<dynamic>?)
          ?.map((e) => Urls.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Results_CharactersToJson(Results_Characters instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'modified': instance.modified,
      'thumbnail': instance.thumbnail,
      'comics': instance.comics,
      'series': instance.series,
      'stories': instance.stories,
      'events': instance.events,
      'urls': instance.urls,
    };

Thumbnail_Characters _$Thumbnail_CharactersFromJson(
        Map<String, dynamic> json) =>
    Thumbnail_Characters(
      json['path'] as String,
      json['extension'] as String,
    );

Map<String, dynamic> _$Thumbnail_CharactersToJson(
        Thumbnail_Characters instance) =>
    <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };

Comics _$ComicsFromJson(Map<String, dynamic> json) => Comics(
      available: json['available'] as int?,
      collectionURI: json['collectionURI'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      returned: json['returned'] as int?,
    );

Map<String, dynamic> _$ComicsToJson(Comics instance) => <String, dynamic>{
      'available': instance.available,
      'collectionURI': instance.collectionURI,
      'items': instance.items,
      'returned': instance.returned,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      resourceURI: json['resourceURI'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
    };
