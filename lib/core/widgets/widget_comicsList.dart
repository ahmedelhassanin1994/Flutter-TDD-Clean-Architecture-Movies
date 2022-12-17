
import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/widgets/widgets_comics.dart';
import 'package:mvvm_project/features/domain/model/model.dart';

class WidgetComicsList extends StatelessWidget{

  late Comics_ comics_;

  WidgetComicsList(this.comics_);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Container(
      width: width,
      height: height*.33,
      child:  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: comics_.items!.length,
          itemBuilder: (context, index) {
            return new GestureDetector(
              child: WidgetComics(
                comics_.items![index]
              ),

            );

          }
      ),

    );
  }


}