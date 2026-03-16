import 'package:agro_info/app/common/models/zonig_result.dart';
import 'package:agro_info/app/common/states/planting_zone_form_state.dart';

sealed class IPlantingZoneState {
  final PlantingZoneFormState formState;

  IPlantingZoneState({required this.formState});
}

class InitialPlantingZoneState implements IPlantingZoneState {
  @override
  final PlantingZoneFormState formState;

  InitialPlantingZoneState(this.formState);
}

class LoadingPlantingZoneState implements IPlantingZoneState {
  @override
  final PlantingZoneFormState formState;

  LoadingPlantingZoneState(this.formState);
}

class LoadedPlantingZoneState implements IPlantingZoneState {
  final ZoningResult zoningData;
  @override
  final PlantingZoneFormState formState;

  LoadedPlantingZoneState({required this.zoningData, required this.formState});
}

class FailurePlantingZoneState implements IPlantingZoneState {
  final String errorMessage;
  @override
  final PlantingZoneFormState formState;

  FailurePlantingZoneState({
    required this.errorMessage,
    required this.formState,
  });
}
