class CityFilter {
  static const String all = 'All';

  static const List<String> cities = [
    all,
    'Aceh',
    'Bali',
    'Balikpapan',
    'Bandung',
    'Gorontalo',
    'Malang',
    'Medan',
    'Surabaya',
    'Ternate',
  ];

  static bool isValidCity(String city) => cities.contains(city);

  static bool isAllCities(String city) => city == all;
}
