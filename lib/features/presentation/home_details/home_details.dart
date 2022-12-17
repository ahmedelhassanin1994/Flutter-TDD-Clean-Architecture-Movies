import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/widgets/widget_comicsList.dart';
import 'package:mvvm_project/features/domain/model/model.dart';

class HomeDetails extends StatefulWidget {
  late ResultsCharacters resultsCharacters;

  HomeDetails(this.resultsCharacters);

  @override
  _HomeDetails createState() => _HomeDetails();
}

class _HomeDetails extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        backgroundColor: ColorManager.dark,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              ListView(
                children: [
                  Container(
                      width: width,
                      height: height * .40,
                      child: CachedNetworkImage(
                        key: UniqueKey(),
                        imageUrl:
                            "${widget.resultsCharacters.thumbnail!.path}/portrait_medium.jpg",
                        fit: BoxFit.cover,
                        useOldImageOnUrlChange: true,
                        filterQuality: FilterQuality.medium,
                        placeholder: (context, url) => Image.asset(
                          ImageAssets.errorImg,
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          ImageAssets.errorImg,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p16,
                        left: AppPading.p8,
                        right: AppPading.p8),
                    child: Text(
                      AppStrings.name,
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: FontSize.s17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p10,
                        left: AppPading.p8,
                        right: AppPading.p8),
                    child: Text(
                      '${widget.resultsCharacters.name}',
                      style: getMediumStyle(
                          color: ColorManager.white, fontSize: FontSize.s20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p20,
                        left: AppPading.p8,
                        right: AppPading.p8),
                    child: Text(
                      AppStrings.des,
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: FontSize.s17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p10,
                        left: AppPading.p8,
                        right: AppPading.p8),
                    child: Text(
                      '${widget.resultsCharacters.description}',
                      style: getRegularStyle(
                          color: ColorManager.white, fontSize: FontSize.s20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p28,
                        left: AppPading.p8,
                        right: AppPading.p8,
                        bottom: AppPading.p8),
                    child: Text(
                      AppStrings.comics,
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: FontSize.s17),
                    ),
                  ),
                  WidgetComicsList(widget.resultsCharacters.comics!),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p28,
                        left: AppPading.p8,
                        right: AppPading.p8,
                        bottom: AppPading.p8),
                    child: Text(
                      AppStrings.series,
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: FontSize.s17),
                    ),
                  ),
                  WidgetComicsList(widget.resultsCharacters.series!),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p28,
                        left: AppPading.p8,
                        right: AppPading.p8,
                        bottom: AppPading.p8),
                    child: Text(
                      AppStrings.stories,
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: FontSize.s17),
                    ),
                  ),
                  WidgetComicsList(widget.resultsCharacters.stories!),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p28,
                        left: AppPading.p8,
                        right: AppPading.p8,
                        bottom: AppPading.p8),
                    child: Text(
                      AppStrings.events,
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: FontSize.s17),
                    ),
                  ),
                  WidgetComicsList(widget.resultsCharacters.events!),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppPading.p28,
                        left: AppPading.p8,
                        right: AppPading.p8,
                        bottom: AppPading.p8),
                    child: Text(
                      AppStrings.related_links,
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: FontSize.s17),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * .33,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: widget.resultsCharacters.urls!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: AppPading.p8,right: AppPading.p8,top: AppPading.p8),
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                     '${ widget.resultsCharacters.urls![index].type.toString().toUpperCase()}',
                                    style: getMediumStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s16
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, color: ColorManager.white,size: FontSize.s28,),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: AppPading.p12),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: ColorManager.white,
                        size: FontSize.s28,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )),
            ],
          ),
        ));
  }
}
