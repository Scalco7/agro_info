import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/services/agrofit_service.dart';
import 'package:agro_info/app/common/states/plague_state.dart';
import 'package:flutter/material.dart';

class PlagueViewmodel with ChangeNotifier {
  final AgroFitService agrofitService;
  IPlagueState _state = LoadingPlagueState();
  IPlagueState get state => _state;
  String _searchTerm = "";

  PlagueViewmodel({required this.agrofitService}) {
    fetchPlagues();
  }

  void _emit(IPlagueState newState) {
    _state = newState;
    notifyListeners();
  }

  List<Plague> get filteredPlagues {
    final s = state;
    if (s is! LoadedPlagueState) return [];

    if (_searchTerm.isNotEmpty) {
      String lowerTerm = _searchTerm.toLowerCase();
      return s.plagues
          .where(
            (p) =>
                p.cientificName.toLowerCase().contains(lowerTerm) ||
                p.comumName.any((n) => n.toLowerCase().contains(lowerTerm)),
          )
          .toList();
    } else {
      return s.plagues;
    }
  }

  String get searchTerm => _searchTerm;

  set searchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    notifyListeners();
  }

  void fetchPlagues() async {
    _emit(LoadingPlagueState());

    try {
      List<Plague> newPlagues = await agrofitService.getPlagues();
      _emit(LoadedPlagueState(newPlagues));
    } catch (e) {
      _emit(ErrorPlagueState(errorMessage: e.toString()));
    }
  }
}
