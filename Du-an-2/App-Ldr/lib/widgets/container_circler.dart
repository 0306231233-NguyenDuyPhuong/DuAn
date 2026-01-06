import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'app_colors.dart';
import 'package:flutter/material.dart';

class ContainerCircler extends StatefulWidget {
  final double initialValue;
  final double max;
  final String title;

  const ContainerCircler({
    super.key,
    required this.initialValue,
    required this.max,
    required this.title,
  });

  @override
  State<ContainerCircler> createState() => _ContainerCirclerState();
}

class _ContainerCirclerState extends State<ContainerCircler> {
  late double currentValue;
  late double maxValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
    maxValue = widget.max;
  }

  @override
  void didUpdateWidget(covariant ContainerCircler oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.max != widget.max) {
      setState(() {
        maxValue = widget.max;
        if (currentValue > maxValue) {
          currentValue = maxValue;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SleekCircularSlider(
          key: ValueKey(maxValue), // 👈 bắt buộc để cập nhật UI
          min: 0,
          max: maxValue,
          initialValue: currentValue,
          appearance: CircularSliderAppearance(
            size: 300,
            angleRange: 360,
            startAngle: 270,
            customColors: CustomSliderColors(
              trackColor: AppColor.kPrimaryPurpleStart.withOpacity(0.1),
              dotColor: AppColor.kPrimaryPurpleStart,
              progressBarColor: AppColor.kPrimaryPurpleEnd,
              hideShadow: true,
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 40,
              progressBarWidth: 40,
              handlerSize: 30,
            ),
            infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(
                fontSize: 0,
                color: Colors.transparent,
              ),
            ),
          ),
          onChange: (double value) {
            setState(() {
              currentValue = value;
            });
          },
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentValue.toStringAsFixed(0),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimaryPurpleStart,
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                color: AppColor.kPrimaryPurpleStart,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
