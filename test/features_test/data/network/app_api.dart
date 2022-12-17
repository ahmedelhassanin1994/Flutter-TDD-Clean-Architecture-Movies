
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/data/data_source/remote_data_source.dart';
import 'package:mvvm_project/features/data/network/app_api.dart';
import 'package:crypto/crypto.dart';
import 'package:mvvm_project/features/data/request/request.dart';
import 'package:mvvm_project/features/data/responeses/response_characters/response_characters.dart';
import 'package:mocktail/mocktail.dart';
import '../../../helper/json_reader.dart';



// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.

class MockClient extends Mock implements AppServiceClient {}


void main() {
  late MockClient homeClient;
  late RemoteDataSourceImplementer remoteDataSourceImplementer;


  final hash = md5.convert(
      utf8.encode("1${Constant.privateKey}${Constant.publicKey}"));
  // final remoteDataSourceImplementer = RemoteDataSourceImplementer(homeClient);
  final tMovieList = Response_Characters.fromJson(
      json.decode(readJson('helper/test_data/characters.json')));

  setUp(() async {
    registerFallbackValue(Uri());
    homeClient=MockClient();
    remoteDataSourceImplementer=RemoteDataSourceImplementer(homeClient);
  });


  void setUpMockHttpClientSuccess200() {
    when(
          () => homeClient.get_Characters(
          Constant.publicKey, hash.toString(), '1', 20),
    ).thenAnswer(
            (_) async => tMovieList);
  }

  group('fetch', () {

     // final data  =   homeClient.get_Characters(Constant.publicKey, hash.toString(), '1', 20);

     // print('json : ${tMovieList.data_characters.toJson()}');
    test(
      'get data ',
          () async {
        // arrange
        when(
              () => homeClient.get_Characters(
              Constant.publicKey, hash.toString(), '1', 20),
        ).thenAnswer(
              (_) async => tMovieList);


        // act
        // remoteDataSourceImplementer.get_Characters(CharactersRequest( Constant.publicKey, hash.toString(), '1', 20));

        // assert
        final response = await homeClient.get_Characters(
            Constant.publicKey, hash.toString(), '1', 20);

           expect(response, tMovieList);


          },
    );


    test(
      'should return data)',
          () async {
            when(
                  () => homeClient.get_Characters(
                  Constant.publicKey, hash.toString(), '1', 20),
            ).thenAnswer(
                    (_) async => tMovieList);

            // act
            final response = await remoteDataSourceImplementer.get_Characters(CharactersRequest(Constant.publicKey, hash.toString(), '1', 20));
            // assert
            expect(response, tMovieList);

      },
    );




  });
}