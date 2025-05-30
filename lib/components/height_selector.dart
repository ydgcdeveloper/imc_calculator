import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final int selectedHeight; // Default height in cm
  final Function(double) onHeightChanged;

  const HeightSelector({super.key, required this.onHeightChanged, required this.selectedHeight});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
        child: Column(
          children: [
            Text('ALTURA', style: TextStyles.bodyText),
            SizedBox(height: 8),
            Text(
              '${widget.selectedHeight} cm',
              style: TextStyle(fontSize: 38, color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Slider(
              value: widget.selectedHeight.toDouble(),
              onChanged: (double value) {
                setState(() {
                  widget.onHeightChanged(value);
                });
              },
              min: 100,
              max: 220,
              divisions: 120,
              label: '${widget.selectedHeight.toInt()} cm',
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
