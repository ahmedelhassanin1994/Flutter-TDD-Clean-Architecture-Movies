import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/core/widgets/widgets_characters.dart';
import 'package:mvvm_project/features/domain/model/model.dart';
import 'package:mvvm_project/features/presentation/home/home_page_state.dart';
import 'package:mvvm_project/features/presentation/home/home_viewmodel.dart';

import 'package:provider/provider.dart';






class HomeScreen extends StatefulWidget {

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {


  CharactersViewModel charactersViewModel= instance<CharactersViewModel>();
   List<ResultsCharacters> searchCharacters=[];
   List<ResultsCharacters> allCharacters=[];

  bool _isSearching = false;
  final _searchTextController = TextEditingController();







  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: ColorManager.grey,
      decoration: InputDecoration(
        hintText: AppStrings.find_character,
        border: InputBorder.none,
        hintStyle: TextStyle(color: ColorManager.grey, fontSize: 18),
      ),
      style: TextStyle(color: ColorManager.grey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchCharacters = allCharacters
        .where((character) =>
        character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    charactersViewModel.start();
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: ColorManager.grey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: ColorManager.grey,
          ),
        ),
      ];
    }
  }
  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }



  Widget getContentWidget(){

     Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => charactersViewModel..getCharacters(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Consumer<CharactersViewModel>(
            builder: (_, value, __) {
              final currentState = value.state;
              if (currentState is HomeLoadingState) {
                return  Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                );
              }
              if (currentState is HomeFailureState) {

                return Expanded(
                  child: Center(
                    child: Text(
                      currentState.message.toString(),
                    ),
                  ),
                );
              }
              if (currentState is HomeSuccessState) {
                print("HomeSuccessState");
                final characters = currentState.haracters;
                print("HomeSuccessState");

                allCharacters = characters.data_characters.results!;
                return Expanded(

                    child:  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: _searchTextController.text.isEmpty
                          ? allCharacters.length
                          : searchCharacters.length,
                      itemBuilder: (context, index) {
                        return new GestureDetector(
                            child: WidgetsCharacters(
                                _searchTextController.text.isEmpty
                                    ? allCharacters[index]
                                    : searchCharacters[index],
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, Routes.home_details,arguments:
                              _searchTextController.text.isEmpty?
                                  allCharacters[index]
                                  :searchCharacters[index]
                              );

                            },
                        );

                      }
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );



  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
      backgroundColor:ColorManager.dark,
        appBar: AppBar(
          backgroundColor: ColorManager.dark,
          // title: Text('${AppStrings.tittle}',style: TextStyle(fontSize: FontSize.s18,color: ColorManager.white,fontWeight: FontWeight.w600),),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: _isSearching
              ? BackButton(
            color: ColorManager.grey,
          )
              : Container(),
          title: _isSearching ? _buildSearchField() : Text('${AppStrings.tittle}',style: getMediumStyle(color: ColorManager.primary,fontSize: FontSize.s20,),),
          actions: _buildAppBarActions(),

        ),
      body: getContentWidget()
    );

  }
}
