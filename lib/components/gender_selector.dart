import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
 final String? selectedGender;
  final Function(String) onGenderChanged;

  const GenderSelector({super.key, required this.selectedGender, required this.onGenderChanged});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onGenderChanged('hombre');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.selectedGender == 'hombre' ? AppColors.backgroundComponentSelected : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset('assets/images/male.png', height: 100),
                      SizedBox(height: 8),
                      Text("HOMBRE", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onGenderChanged('mujer');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 16, top: 16, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.selectedGender == 'mujer' ? AppColors.backgroundComponentSelected : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset('assets/images/female.png', height: 100),
                      SizedBox(height: 8),
                      Text("MUJER", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
