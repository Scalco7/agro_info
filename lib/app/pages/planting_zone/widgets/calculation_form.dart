import 'package:agro_info/app/common/enums/state_enum.dart';
import 'package:agro_info/app/common/models/agritec_crop.dart';
import 'package:agro_info/app/common/models/city.dart';
import 'package:agro_info/app/common/services/agritec_service.dart';
import 'package:agro_info/app/common/widgets/app_dropdown_menu.dart';
import 'package:flutter/material.dart';

class CalculationForm extends StatefulWidget {
  final AgriTecService agriTecService = AgriTecService();
  final void Function({
    required int ibgeCode,
    required String risk,
    required int cropId,
  })
  onCalcRisk;
  CalculationForm({super.key, required this.onCalcRisk});

  @override
  State<CalculationForm> createState() => _CalculationFormState();
}

class _CalculationFormState extends State<CalculationForm> {
  TextEditingController stateController = TextEditingController();
  StateEnum? selectedState;
  TextEditingController cityController = TextEditingController();
  City? selectedCity;
  TextEditingController cropController = TextEditingController();
  AgritecCrop? selectedCrop;
  TextEditingController riskController = TextEditingController();

  bool buttonIsEnable = false;

  List<AgritecCrop>? cropies;
  List<City>? cities;

  void fetchCities(StateEnum state) async {
    List<City> newCities = await widget.agriTecService.getCities(state);
    setState(() {
      cities = newCities;
    });
  }

  void fetchCropies() async {
    List<AgritecCrop> newCropies = await widget.agriTecService.getCropies();
    setState(() {
      cropies = newCropies;
    });
  }

  void handleOnSelectState(StateEnum? newState) {
    if (selectedState == newState) {
      return;
    }

    selectedState = newState;

    if (newState == null) {
      return;
    }

    cityController.clear();
    setState(() {
      cities = null;
    });
    fetchCities(newState);
  }

  void handleOnSelectCity(City? city) {
    if (selectedCity == city) {
      return;
    }

    selectedCity = city;
  }

  void handleOnSelectCrop(AgritecCrop? crop) {
    if (selectedCrop == crop) {
      return;
    }

    selectedCrop = crop;
  }

  void verifyFormValidity() {
    bool enable = true;
    if (cityController.text.isEmpty ||
        cropController.text.isEmpty ||
        riskController.text.isEmpty) {
      enable = false;
    }

    setState(() {
      buttonIsEnable = enable;
    });
  }

  void handleOnCalcRisk() {
    if (selectedCity == null) {
      return;
    }
    if (selectedCrop == null) {
      return;
    }
    if (riskController.text.isEmpty) {
      return;
    }

    widget.onCalcRisk(
      ibgeCode: selectedCity!.ibgeCode,
      cropId: selectedCrop!.id,
      risk: riskController.text,
    );
  }

  @override
  void initState() {
    fetchCropies();

    cityController.addListener(verifyFormValidity);
    cropController.addListener(verifyFormValidity);
    riskController.addListener(verifyFormValidity);

    super.initState();
  }

  @override
  void dispose() {
    stateController.dispose();
    cityController.dispose();
    cropController.dispose();
    riskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 40,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calculo do Risco de Plantio",
              style: TextStyle(fontWeight: FontWeight(600), fontSize: 20),
            ),
            Text(
              "Calculo Baseado no Zoneamento Agrícola de Risco Climático",
              style: TextStyle(fontWeight: FontWeight(400), fontSize: 14),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 26,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Expanded(
                  flex: 2,
                  child: AppDropdownMenu(
                    onSelected: handleOnSelectState,
                    controller: stateController,
                    label: Text("Estado"),
                    hintText: "Selecione o Estado",
                    prefixIcon: Icon(Icons.public),
                    enableSearch: true,
                    menuHeight: 340,
                    dropdownMenuEntries: StateEnum.values
                        .map(
                          (state) => DropdownMenuEntry<StateEnum>(
                            value: state,
                            label: state.name,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AppDropdownMenu(
                    onSelected: handleOnSelectCity,
                    controller: cityController,
                    label: Text("Cidade"),
                    hintText: "Selecione a Cidade",
                    prefixIcon: Icon(Icons.home_work_outlined),
                    loadingText: "Carregando Cidades...",
                    emptyText: "Nenhuma Cidade Disponível",
                    enable: cities != null,
                    enableSearch: true,
                    menuHeight: 340,
                    dropdownMenuEntries: cities
                        ?.map(
                          (city) => DropdownMenuEntry<City>(
                            value: city,
                            label: city.name,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            AppDropdownMenu(
              onSelected: handleOnSelectCrop,
              controller: cropController,
              label: Text("Cultura"),
              hintText: "Selecione a Cultura",
              prefixIcon: Icon(Icons.grass),
              enableSearch: true,
              menuHeight: 260,
              loadingText: "Carregando Culturas...",
              emptyText: "Nenhuma Cultura Disponível",
              dropdownMenuEntries: cropies
                  ?.map(
                    (crop) => DropdownMenuEntry<AgritecCrop>(
                      value: crop,
                      label: crop.name,
                    ),
                  )
                  .toList(),
            ),
            AppDropdownMenu(
              controller: riskController,
              label: Text("Risco"),
              suffix: Text("%"),
              prefixIcon: Icon(Icons.percent),
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(label: "20", value: "20"),
                DropdownMenuEntry<String>(label: "30", value: "30"),
                DropdownMenuEntry<String>(label: "40", value: "40"),
                DropdownMenuEntry<String>(label: "Todos", value: "todos"),
              ],
            ),
          ],
        ),
        FilledButton(
          onPressed: buttonIsEnable ? handleOnCalcRisk : null,
          child: Text("Calcular Risco"),
        ),
      ],
    );
  }
}
