

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/features/domain/model/model.dart';

import '../resources/constants/color_manager.dart';
import '../resources/constants/fonts_manager.dart';
import '../resources/constants/value_manager.dart';

class WidgetsCharacters extends StatelessWidget{

  late ResultsCharacters resultsCharacters;


  WidgetsCharacters(this.resultsCharacters);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
   return Container(
     width: width,

     child: Stack(
       children: <Widget>[
         Container(
           width: width,
             height: height*.25,
           child: CachedNetworkImage(
           key: UniqueKey(),
           imageUrl: "${resultsCharacters.thumbnail!.path}/portrait_medium.jpg",
           fit: BoxFit.cover,
            useOldImageOnUrlChange: true,
            filterQuality: FilterQuality.medium,
             placeholder: (context, url) =>
             Image.asset(ImageAssets.errorImg,
               fit: BoxFit.cover,
             ),
             errorWidget: (context, url, error) => Image.asset(
           ImageAssets.errorImg,
           fit: BoxFit.cover,
            ),
           )

         ),

       Align(
         alignment: Alignment.bottomLeft,
         child: Container(
           color: ColorManager.white,
           padding: EdgeInsets.all(AppPading.p8),
           margin: EdgeInsets.only(top: AppPading.p100,left: AppPading.p16,right: AppPading.p16),
           child: Text(resultsCharacters.name!,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s18),),
         )),
       ],
     ),
     // child: CachedNetworkImage(
     //     key: UniqueKey(),
     //     imageUrl: "${resultsCharacters.thumbnail!.path}/portrait_medium.jpg",
     //     fit: BoxFit.cover,
     //   useOldImageOnUrlChange: true,
     //   filterQuality: FilterQuality.medium,
     //   placeholder: (context, url) =>
     //       Image.asset(ImageAssets.errorImg,
     //         fit: BoxFit.cover,
     //       ),
     //   errorWidget: (context, url, error) => Image.asset(
     //     ImageAssets.errorImg,
     //     fit: BoxFit.cover,
     //   ),
     // ),
   );
  }

}