import 'package:flutter/material.dart';

class RatingSlider extends StatefulWidget {
  const RatingSlider({super.key, required this.onChanged});

  final ValueChanged<double> onChanged;

  @override
  _RatingSliderState createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  double current = 2.5;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Slider(
        value: current,
        min: 0.0,
        max: 5.0,
        divisions: 50,
        activeColor: Colors.purple,
        inactiveColor: Colors.grey[200],
        label: current.toStringAsFixed(1),
        onChanged: (val) {
          setState(() {
            current = val;
            widget.onChanged(val);
          });
        },
      ),
    );
  }
}
