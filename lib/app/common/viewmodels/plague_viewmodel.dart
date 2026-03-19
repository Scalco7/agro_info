import 'package:agro_info/app/common/enums/app_route_enum.dart';
import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/agrofit_service.dart';
import 'package:agro_info/app/common/states/plague_state.dart';
import 'package:flutter/material.dart';

class PlagueViewmodel with ChangeNotifier {
  final Set<PlagueClassification> _classificationFilters = {};
  final AgroFitService agrofitService;
  IPlagueState _state = LoadingPlagueState();
  IPlagueState get state => _state;
  String _searchTerm = "";

  PlagueViewmodel(this.agrofitService) {
    fetchPlagues();
  }

  void _emit(IPlagueState newState) {
    _state = newState;
    notifyListeners();
  }

  void fetchPlagues() async {
    _emit(LoadingPlagueState());

    final apiResult = await agrofitService.getPlagues();

    switch (apiResult) {
      case Success(value: var newPlagues):
        _emit(LoadedPlagueState(newPlagues));
        break;
      case Failure(error: var error):
        _emit(ErrorPlagueState(errorMessage: error.toString()));
        break;
    }
  }

  List<Plague> get filteredPlagues {
    final s = state;
    if (s is! LoadedPlagueState) return [];

    var newFilteredPlague = s.plagues;

    if (_classificationFilters.isNotEmpty) {
      newFilteredPlague = newFilteredPlague
          .where((p) => _classificationFilters.contains(p.classification))
          .toList();
    }

    if (_searchTerm.isNotEmpty) {
      String lowerTerm = _searchTerm.toLowerCase();
      newFilteredPlague = newFilteredPlague
          .where(
            (p) =>
                p.cientificName.toLowerCase().contains(lowerTerm) ||
                p.comumName.any((n) => n.toLowerCase().contains(lowerTerm)),
          )
          .toList();
    }

    return newFilteredPlague;
  }

  String get searchTerm => _searchTerm;

  set searchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    notifyListeners();
  }

  bool get hasActiveFilters => _classificationFilters.isNotEmpty;

  Set<PlagueClassification> get classificationFilters => _classificationFilters;

  void clearFilters() {
    _classificationFilters.clear();
    notifyListeners();
  }

  void goToPlagueDetails(BuildContext context, Plague plague){
    Navigator.of(context).pushNamed(AppRouteEnum.plagueDetails.name, arguments: plague);
  }

  void toggleFilter(PlagueClassification classification) {
    if (_classificationFilters.contains(classification)) {
      _classificationFilters.remove(classification);
    } else {
      _classificationFilters.add(classification);
    }
    notifyListeners();
  }
}
