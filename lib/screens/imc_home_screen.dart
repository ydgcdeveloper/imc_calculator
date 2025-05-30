import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 25;
  int selectedWeight = 70;
  int selectedHeight = 170;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(selectedGender: selectedGender, onGenderChanged: (value) {
          setState(() {
            selectedGender = value;
          });
        }),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChanged: (value) {
            setState(() {
              selectedHeight = value.toInt();
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              NumberSelector(
                title: 'PESO',
                value: selectedWeight,
                onDecrement: () {
                  setState(() {
                    if (selectedWeight > 0) selectedWeight--;
                  });
                },
                onIncrement: () {
                  setState(() {
                    selectedWeight++;
                  });
                },
              ),
              SizedBox(width: 16),
              NumberSelector(
                title: 'EDAD',
                value: selectedAge,
                onDecrement: () {
                  setState(() {
                    if (selectedAge > 0) selectedAge--;
                  });
                },
                onIncrement: () {
                  setState(() {
                    selectedAge++;
                  });
                },
              ),
            ],
          ),
        ),
        Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImcResultScreen(
                  age: selectedAge,
                  height: selectedHeight,
                  weight: selectedWeight,
                  gender: selectedGender,
                )));
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              child: const Text('Calcular', style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
