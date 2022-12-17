

import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';


import 'package:mvvm_project/features/data/cache_model/model_cache.dart';
import 'package:mvvm_project/features/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/data/data_source/remote_data_source.dart';
import 'package:mvvm_project/features/data/mapper/mapper.dart';
import 'package:mvvm_project/core/network/error_handler.dart';
import 'package:mvvm_project/core/network/failure.dart';
import 'package:mvvm_project/core/network/network_info.dart';
import 'package:mvvm_project/features/data/request/request.dart';
import 'package:mvvm_project/features/data/responeses/response_characters/response_characters.dart';
import 'package:mvvm_project/features/domain/model/model.dart';
import 'package:mvvm_project/features/domain/repository/repository.dart';

class RepositoryImpl extends Repository{

  late  RemoteDataSource _remoteDataSource;
  late NetworkInfo _networkInfo;
  late LocalDataSource localDataSource;



  RepositoryImpl(this._remoteDataSource, this._networkInfo,this.localDataSource);

  @override
  Future<Either<Failure, ModelCharacters>> get_Characters(CharactersRequest charactersRequest) async{

    if(await _networkInfo.isConnected){

      try{

        // its safe call the api
        final response=await _remoteDataSource.get_Characters(charactersRequest);

        if(response.code == ApiInternalStatus.Sucess){



           await localDataSource.deleteLocal("Characters");
            Model_Cache model_cache_setting=new Model_Cache("Characters",jsonEncode(response));
            await localDataSource.AddCache(model_cache_setting);


          //  mapper problem
          return Right(response.toDomain());

         }else{

          // return biz logic error

          return Left(Failure(1,response.status));

        }

      }catch(e){

        return Left(ErrorHandler.handle(e).failure);

      }

    }else{
      // return connection error

      try{

        var data=await localDataSource.getCache();
        Model_Cache model_cache=  data.where((element) => element.key.toString().contains("Characters")).first;
        var response= Response_Characters.fromJson(json.decode(model_cache.value));

        return Right(response.toDomain());
      }catch(e){
        return Left(ErrorHandler.handle(e).failure);
      }

      // return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());


    }

  }



}