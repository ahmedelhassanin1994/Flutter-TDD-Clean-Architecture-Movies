

import 'package:mvvm_project/features/data/network/app_api.dart';
import 'package:mvvm_project/features/data/request/request.dart';
import 'package:mvvm_project/features/data/responeses/response_characters/response_characters.dart';

abstract class RemoteDataSource{
  Future<Response_Characters> get_Characters(CharactersRequest loginRequest);

}


class RemoteDataSourceImplementer implements RemoteDataSource{
 late AppServiceClient _appServiceClient;


 RemoteDataSourceImplementer(this._appServiceClient);


  @override
  Future<Response_Characters> get_Characters(CharactersRequest charactersRequest) async{
    // TODO: implement login
   return _appServiceClient.get_Characters(charactersRequest.api_key,charactersRequest.hash,charactersRequest.ts,charactersRequest.limit);
  }
  
}