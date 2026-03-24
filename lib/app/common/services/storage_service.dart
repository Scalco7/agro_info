import 'package:agro_info/app/common/enums/commodities_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final String _selectedCommoditiesKey = "selected_commodities";

  static Future<void> saveSelectedCommodities(
    List<CommoditiesEnum> value,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var commodityCodes = value.map((commmodity) => commmodity.code).toList();
    await prefs.setStringList(_selectedCommoditiesKey, commodityCodes);
  }

  static Future<List<CommoditiesEnum>> getSelectedCommodities() async {
    final prefs = await SharedPreferences.getInstance();
    var commoditiesList = prefs.getStringList(_selectedCommoditiesKey);

    if (commoditiesList == null) {
      return [];
    }

    return commoditiesList
        .map((commodityCode) => CommoditiesEnum.fromCode(commodityCode))
        .toList();
  }
}
