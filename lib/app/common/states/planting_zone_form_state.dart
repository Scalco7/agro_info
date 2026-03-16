import 'package:agro_info/app/common/models/agritec_crop.dart';
import 'package:agro_info/app/common/models/city.dart';

class PlantingZoneFormState {
  final List<City> cities;
  final List<AgritecCrop> cropies;

  final bool isLoadingCitites;
  final bool isLoadingCropies;

  PlantingZoneFormState({
    required this.cities,
    required this.cropies,
    required this.isLoadingCitites,
    required this.isLoadingCropies,
  });

  PlantingZoneFormState copyWith({
    List<City>? cities,
    List<AgritecCrop>? cropies,
    bool? isLoadingCitites,
    bool? isLoadingCropies,
  }) {
    return PlantingZoneFormState(
      cities: cities ?? this.cities,
      cropies: cropies ?? this.cropies,
      isLoadingCitites: isLoadingCitites ?? this.isLoadingCitites,
      isLoadingCropies: isLoadingCropies ?? this.isLoadingCropies,
    );
  }
}
