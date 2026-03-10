import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/services/agrofit_service.dart';
import 'package:flutter/material.dart';

class PlagueProvider with ChangeNotifier {
  final AgroFitService agrofitService = AgroFitService();

  String _searchTerm = "";
  List<Plague>? _plagues;

  PlagueProvider() {
    _fetchPlagues();
  }

  void _fetchPlagues() async {
    plagues = await agrofitService.getPlagues();
  }

  List<Plague>? get plagues {
    if (searchTerm.isNotEmpty && _plagues != null) {
      String lowerTerm = searchTerm.toLowerCase();
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

  String get searchTerm => _searchTerm;

  set searchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    notifyListeners();
  }
}
