class AppAssets {
  static const String banner = 'assets/images/img_banner.png';
  static const String placeholder = 'assets/images/placeholder.png';

  static const String iconFastDelivery = 'assets/icons/ic_fast_delivery.png';
  static const String iconNusantaraFlavors =
      'assets/icons/ic_nusantara_flavors.png';
  static const String iconTopRestaurants =
      'assets/icons/ic_top_restaurants.png';

  static const String baseImageUrl =
      'https://restaurant-api.dicoding.dev/images/medium/';
  static const String smallImageUrl =
      'https://restaurant-api.dicoding.dev/images/small/';
  static const String largeImageUrl =
      'https://restaurant-api.dicoding.dev/images/large/';

  static String getImageUrl(
    String pictureId, {
    ImageSize size = ImageSize.medium,
  }) {
    switch (size) {
      case ImageSize.small:
        return '$smallImageUrl$pictureId';
      case ImageSize.medium:
        return '$baseImageUrl$pictureId';
      case ImageSize.large:
        return '$largeImageUrl$pictureId';
    }
  }
}

enum ImageSize { small, medium, large }
