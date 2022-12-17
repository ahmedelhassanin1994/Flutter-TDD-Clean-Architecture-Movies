

import 'package:flutter/cupertino.dart';

class ColorManager{

  static Color primary=HexColor.fromHex("#D9395D");
  static Color darkGray=HexColor.fromHex("#ED9728");
  static Color grey=HexColor.fromHex("#737477");
  static Color lightGrey=HexColor.fromHex("#9EE9E9E");
  static Color primaryOpacity70=HexColor.fromHex("#B3ED9728");
  static Color black=HexColor.fromHex("#000000"); // red color


  // new color

  static Color darkPrimary=HexColor.fromHex("#d17d11");
  static Color grey1=HexColor.fromHex("#707070");
  static Color grey2=HexColor.fromHex("#797979");
  static Color white=HexColor.fromHex("#FFFFFF");
  static Color error=HexColor.fromHex("#e61f34"); // red color
  static const dark = Color(0xFF313140);


}

extension HexColor on Color{

  static Color fromHex(String hexcolorstring){
    hexcolorstring=hexcolorstring.replaceAll("#", "");
    if(hexcolorstring.length==6){
      hexcolorstring="ff"+hexcolorstring;
    }

    return Color(int.parse(hexcolorstring,radix: 16));
  }
}