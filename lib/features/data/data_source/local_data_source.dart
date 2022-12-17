
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/data/cache_model/model_cache.dart';
import 'package:mvvm_project/features/data/responeses/response_characters/response_characters.dart';




abstract class LocalDataSource {

 Future<Box> Openbox();
 Future<List<Model_Cache>> getCache();
 Future <void> AddCache(Model_Cache modelcache);
 Future <void> deleteLocal(var tittle);

 }


class LocalDataSourceImplementer implements LocalDataSource{

  @override
  Future<void> AddCache(Model_Cache modelcache)async {
    // TODO: implement AddCache
    final box=await Openbox();
    await box.add(modelcache);
  }

  @override
  Future<Box> Openbox() async{
    // TODO: implement Openbox
    var box=await Hive.openBox<Model_Cache>(Constant.localKey);
    return box;
  }

  @override
  Future<void> deleteLocal(tittle) async{
    // TODO: implement deleteLocal

    final box=await Openbox();
    final Map<dynamic, dynamic> deliveriesMap = box.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value){
      if (value.key == tittle)
        desiredKey = key;
    });
    box.delete(desiredKey);
  }

  @override
  Future<List<Model_Cache>> getCache() async{
    // TODO: implement getCache
    final box=await Openbox();
    List<Model_Cache> model=box.values.cast<Model_Cache>().toList();
    Model_Cache model_cache=  model.where((element) => element.key.toString().contains("Characters")).first;
    // var response= Response_Characters.fromJson(json.decode(model_cache.value));
    return model;
  }



  
}