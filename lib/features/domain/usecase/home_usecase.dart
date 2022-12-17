
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/base_usecase.dart';
import 'package:mvvm_project/core/network/failure.dart';
import 'package:mvvm_project/features/data/request/request.dart';
import 'package:mvvm_project/features/domain/model/model.dart';
import 'package:mvvm_project/features/domain/repository/repository.dart';


class LoginUseCase implements BaseCase<CharactersUseCaseInput,ModelCharacters>{

 late Repository _repository;

 LoginUseCase(this._repository);

  @override
  Future<Either<Failure, ModelCharacters>> execute(CharactersUseCaseInput input) async{
    // TODO: implement execute
   return  await _repository.get_Characters(CharactersRequest(input.api_key,input.ts,input.hash,input.limit));
  }

}

class CharactersUseCaseInput{
  late String api_key;
  late String hash;
  late String ts;
  late int limit;

  CharactersUseCaseInput(this.api_key, this.hash, this.ts, this.limit);
}