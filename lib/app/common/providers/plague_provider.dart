import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/services/agrofit_service.dart';
import 'package:flutter/material.dart';

class PlagueProvider with ChangeNotifier {
  final AgroFitService agrofitService = AgroFitService();
  List<Plague>? _plagues;

  PlagueProvider() {
    _fetchPlagues();
  }

  void _fetchPlagues() async {
    plagues = await agrofitService.getPlagues();
  }

  List<Plague>? get plagues => _plagues;

  set plagues(List<Plague> plagues) {
    _plagues = plagues;
    notifyListeners();
  }
}
