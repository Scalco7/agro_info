import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/services/agrofit_service.dart';
import 'package:flutter/material.dart';

class PlagueProvider with ChangeNotifier {
  final AgroFitService agrofitService = AgroFitService();

  final TextEditingController _searchController = TextEditingController(text: "");
  List<Plague>? _plagues;

  PlagueProvider() {
    _searchController.addListener(() {
      notifyListeners();
    });
    _fetchPlagues();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _fetchPlagues() async {
    plagues = await agrofitService.getPlagues();
  }

  List<Plague>? get plagues {
    if (_searchController.text.isNotEmpty && _plagues != null) {
      String lowerTerm = _searchController.text.toLowerCase();
      return _plagues!
          .where(
            (p) =>
                p.cientificName.toLowerCase().contains(lowerTerm) ||
                p.comumName.any((n) => n.toLowerCase().contains(lowerTerm)),
          )
          .toList();
    } else {
      return _plagues;
    }
  }

  set plagues(List<Plague> plagues) {
    _plagues = plagues;
    notifyListeners();
  }

  TextEditingController get searchController => _searchController;
}
