import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';

class SweakaSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;

  const SweakaSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeColor = SweakaColors.secondaryColor,
    this.inactiveColor = SweakaColors.grey_scale_2,
    this.width = 44,
    this.height = 24,
  }) : super(key: key);

  @override
  _SweakaSwitchState createState() => _SweakaSwitchState();
}

class _SweakaSwitchState extends State<SweakaSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          color: _value ? widget.activeColor : widget.inactiveColor,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 150),
          alignment:
              _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: widget.height - 4,
            width: widget.height - 4,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _value = !_value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_value);
    }
  }
}
