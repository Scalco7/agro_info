import 'package:agro_info/app/common/enums/state_enum.dart';
import 'package:agro_info/app/common/widgets/app_dropdown_menu.dart';
import 'package:flutter/material.dart';

class CalculationForm extends StatefulWidget {
  const CalculationForm({super.key});

  @override
  State<CalculationForm> createState() => _CalculationFormState();
}

class _CalculationFormState extends State<CalculationForm> {
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
                    label: Text("Cidade"),
                    hintText: "Selecione a Cidade",
                    prefixIcon: Icon(Icons.home_work_outlined),
                    dropdownMenuEntries: [
                      DropdownMenuEntry<String>(
                        label: "Test 1",
                        value: "Teste 1",
                      ),
                      DropdownMenuEntry<String>(
                        label: "Test 2",
                        value: "Teste 2",
                      ),
                      DropdownMenuEntry<String>(
                        label: "Test 3",
                        value: "Teste 3",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppDropdownMenu(
              label: Text("Cultura"),
              hintText: "Selecione a Cultura",
              prefixIcon: Icon(Icons.grass),
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(label: "Test 1", value: "Teste 1"),
                DropdownMenuEntry<String>(label: "Test 2", value: "Teste 2"),
                DropdownMenuEntry<String>(label: "Test 3", value: "Teste 3"),
              ],
            ),
            AppDropdownMenu(
              label: Text("Risco"),
              suffix: Text("%"),
              prefixIcon: Icon(Icons.percent),
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(label: "20", value: "Teste 1"),
                DropdownMenuEntry<String>(label: "30", value: "Teste 2"),
                DropdownMenuEntry<String>(label: "40", value: "Teste 3"),
                DropdownMenuEntry<String>(label: "Todos", value: "Teste 3"),
              ],
            ),
          ],
        ),
        FilledButton(onPressed: () {}, child: Text("Calcular Risco")),
      ],
    );
  }
}
