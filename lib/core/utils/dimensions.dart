import 'package:get/get.dart';

class Dimensions {
  static double get _screenWidth => Get.mediaQuery.size.width;

  static double fontSizeExtraSmall = _screenWidth >= 1300 ? 14 : 10;
  static double fontSizeSmall = _screenWidth >= 1300 ? 16 : 12;
  static double fontSizeDefault = _screenWidth >= 1300 ? 18 : 14;
  static double fontSizeLarge = _screenWidth >= 1300 ? 20 : 16;
  static double fontSizeExtraLarge = _screenWidth >= 1300 ? 22 : 18;
  static double fontSizeOverLarge = _screenWidth >= 1300 ? 28 : 24;
  static double fontSizeDoubleOverLarge = _screenWidth >= 1300 ? 30 : 28;

  static const double PADDING_SIZE_EXTRA_SMALL = 5.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double PADDING_SIZE_DEFAULT = 15.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;
  static const double PADDING_SIZE_OVER_LARGE = 30.0;
  static const double PADDING_SIZE_DOUUBLEOVER_LARGE = 60.0;

  static const double RADIUS_SMALL = 5.0;
  static const double RADIUS_DEFAULT = 10.0;
  static const double RADIUS_LARGE = 15.0;
  static const double RADIUS_EXTRA_LARGE = 20.0;

  static const double WEB_MAX_WIDTH = 1170;
  static const int MESSAGE_INPUT_LENGTH = 250;
}
