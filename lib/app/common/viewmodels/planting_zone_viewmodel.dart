import 'package:agro_info/app/common/enums/state_enum.dart';
import 'package:agro_info/app/common/models/agritec_crop.dart';
import 'package:agro_info/app/common/models/city.dart';
import 'package:agro_info/app/common/models/zonig_result.dart';
import 'package:agro_info/app/common/services/agritec_service.dart';
import 'package:agro_info/app/common/states/planting_zone_form_state.dart';
import 'package:agro_info/app/common/states/planting_zone_state.dart';
import 'package:flutter/material.dart';

class PlantingZoneViewmodel with ChangeNotifier {
  final AgriTecService _agriTecService;
  IPlantingZoneState _state;
  IPlantingZoneState get state => _state;

  PlantingZoneViewmodel(this._agriTecService)
    : _state = InitialPlantingZoneState(
        PlantingZoneFormState(
          cities: [],
          cropies: [],
          isLoadingCitites: true,
          isLoadingCropies: true,
        ),
      ) {
    fetchCropies();
  }

  void _emit(IPlantingZoneState newState) {
    _state = newState;
    notifyListeners();
  }

  void fetchCities(StateEnum state) async {
    PlantingZoneFormState loadingFormState = _state.formState.copyWith(
      isLoadingCitites: true,
    );

    _emit(InitialPlantingZoneState(loadingFormState));

    try {
      List<City> newCities = await _agriTecService.getCities(state);
      PlantingZoneFormState newFormState = _state.formState.copyWith(
        cities: newCities,
        isLoadingCitites: false,
      );

      _emit(InitialPlantingZoneState(newFormState));
    } catch (e) {
      _emit(
        FailurePlantingZoneState(
          errorMessage: e.toString(),
          formState: _state.formState.copyWith(isLoadingCitites: false),
        ),
      );
    }
  }

  void fetchCropies() async {
    try {
      List<AgritecCrop> newCropies = await _agriTecService.getCropies();

      PlantingZoneFormState newFormState = _state.formState.copyWith(
        cropies: newCropies,
        isLoadingCropies: false,
      );

      _emit(InitialPlantingZoneState(newFormState));
    } catch (e) {
      _emit(
        FailurePlantingZoneState(
          errorMessage: e.toString(),
          formState: _state.formState.copyWith(isLoadingCropies: false),
        ),
      );
    }
  }

  void getPlantingDateByFailingRisk({
    required int cropId,
    required int ibgeCode,
    required String risk,
  }) async {
    _emit(LoadingPlantingZoneState(_state.formState));

    try {
      ZoningResult newZoningResult = await _agriTecService
          .getPlantingDateByFailingRisk(
            cropId: cropId,
            ibgeCode: ibgeCode,
            risk: risk,
          );

      _emit(
        LoadedPlantingZoneState(
          formState: _state.formState,
          zoningData: newZoningResult,
        ),
      );
    } catch (e) {
      _emit(
        FailurePlantingZoneState(
          errorMessage: e.toString(),
          formState: _state.formState,
        ),
      );
    }
  }
}
