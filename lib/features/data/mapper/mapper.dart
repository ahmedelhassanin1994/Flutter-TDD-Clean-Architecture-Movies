

// to convert the response into an non nullable object (model)


import 'package:mvvm_project/core/extensions.dart';
import 'package:mvvm_project/features/data/responeses/response_characters/response_characters.dart';
import 'package:mvvm_project/features/domain/model/model.dart';

const EMPTY="";
const ZERO=0;
const STATUS=false;


extension CharactersMapper on Response_Characters?{
  ModelCharacters toDomain(){
    return ModelCharacters(this?.code,this?.status,this?.copyright,this?.attributionText,this?.attributionHTML,this?.etag,this!.data_characters.toDomain());
  }
}


extension Data_CharactersMapper on Data_Characters?{

  DataCharacters toDomain(){
    List<ResultsCharacters>? results_mapper=(this?.results!.map((e) => e.toDomain()) ?? Iterable.empty()).cast<ResultsCharacters>().toList();
    return DataCharacters(this?.offset,this?.limit,this?.total,this?.count,results_mapper);


  }
}


extension Results_CharactersMapper on Results_Characters?{
  ResultsCharacters toDomain(){

    List<Urls_>? urls_mapper=(this?.urls!.map((e) => e.toDomain()) ?? Iterable.empty()).cast<Urls_>().toList();

    return ResultsCharacters(this?.id,this?.name,this?.description,this?.modified,this?.thumbnail.toDomain(),this?.comics.toDomain(),this?.series.toDomain(),this?.stories.toDomain(),this?.events.toDomain(),urls_mapper);

  }}

  extension ThumbnailCharacters_Mapper on Thumbnail_Characters?{
    ThumbnailCharacters toDomain(){

  return ThumbnailCharacters(this!.path.orEmpty(),this!.extension);

  }
}

extension Comics_Mapper on Comics?{
  Comics_ toDomain(){
    List<Items_>? item_mapper=(this?.items!.map((e) => e.toDomain()) ?? Iterable.empty()).cast<Items_>().toList();

    return Comics_(this!.available,this!.collectionURI,item_mapper,this!.returned);

  }
}


extension Item_Mapper on Items?{
  Items_ toDomain(){
    return Items_(this!.resourceURI,this!.name);

  }
}

extension URL_Mapper on Urls?{
  Urls_ toDomain(){
    return Urls_(this!.type,this!.url);

  }
}

