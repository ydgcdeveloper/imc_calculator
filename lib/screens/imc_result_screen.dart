import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/models/imc_data.dart';

class ImcResultScreen extends StatelessWidget {
  final String? gender;
  final int height;
  final int weight;
  final int age;

  const ImcResultScreen({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    double fixedHeight = height / 100; // Convert height to meters
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(imcResult, context),
    );
  }

  Padding bodyResult(double result, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Tu resultado:",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
                top: 24,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getDataByImc(result).title,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getDataByImc(result).color,
                      ),
                    ),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 76,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getDataByImc(result).description,
                      style: TextStyles.bodyText.copyWith(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text('Finalizar', style: TextStyles.bodyText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text('Resultado IMC'),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, // Underweight
      < 24.9 => Colors.green, // Normal weight
      < 29.9 => Colors.yellow, // Overweight
      < 34.9 => Colors.orange, // Obesity class I
      < 39.9 => Colors.red, // Obesity class II
      >= 40 => Colors.purple, // Obesity class III
      _ => Colors.grey, // Default color for IMC result
    };
  }

  String getTitleByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Imc peso",
      < 24.9 => "Imc normal",
      < 29.9 => "Sobrepeso",
      < 34.9 => "Obesidad clase I",
      < 39.9 => "Obesidad clase II",
      >= 40 => "Obesidad clase III",
      _ => "IMC no válido",
    };
  }

  String getDescriptionByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Estás por debajo del peso ideal.",
      < 24.9 => "Tienes un peso saludable.",
      < 29.9 => "Tienes sobrepeso, considera mejorar tu dieta.",
      < 34.9 => "Obesidad clase I, es recomendable consultar a un profesional.",
      < 39.9 => "Obesidad clase II, es importante buscar ayuda médica.",
      >= 40 => "Obesidad clase III, se requiere atención médica urgente.",
      _ => "IMC no válido",
    };
  }

  ImcData getDataByImc(double imcResult) {
    return ImcData(
      title: getTitleByImc(imcResult),
      description: getDescriptionByImc(imcResult),
      color: getColorByImc(imcResult),
    );
  }
}
