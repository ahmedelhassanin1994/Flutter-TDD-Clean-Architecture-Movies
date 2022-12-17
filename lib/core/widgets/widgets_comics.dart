
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/features/domain/model/model.dart';

import '../resources/constants/assets_manager.dart';
import '../resources/constants/color_manager.dart';
import '../resources/constants/styles_manger.dart';
import '../resources/constants/value_manager.dart';

class WidgetComics extends StatelessWidget{

 late Items_ items_;
 WidgetComics(this.items_);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Container(
      width: width*.33,
      margin: EdgeInsets.only(left: AppPading.p4,right: AppPading.p4),
      child: Column(
        children: <Widget>[
          Container(
            width: width*.32,
            height: height*.23,
            child: CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: "${items_.resourceURI}/portrait_medium.jpg",
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
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: AppPading.p8),
            child: Text(
              '${items_.name}',
              style: getRegularStyle(
                fontSize: FontSize.s12,
                color: ColorManager.white
              ),
            ),
          ),
        ],
      ),

    );
  }

}