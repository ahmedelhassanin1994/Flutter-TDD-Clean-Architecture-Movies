

import 'package:dio/dio.dart';
import 'package:mvvm_project/features/data/responeses/response_characters/response_characters.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constant.dart';

part 'app_api.g.dart';


@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient{

  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @GET("/characters")
  Future<Response_Characters> get_Characters(@Query("apikey") String apikey ,@Query("hash") String hash,@Query("ts") String ts,@Query("limit") int limit);

}