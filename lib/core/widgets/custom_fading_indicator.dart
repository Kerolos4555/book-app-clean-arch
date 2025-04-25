import 'package:flutter/material.dart';

class CustomFadingIndicator extends StatefulWidget {
  final Widget childWidget;
  const CustomFadingIndicator({
    super.key,
    required this.childWidget,
  });

  @override
  State<CustomFadingIndicator> createState() => _CustomFadingIndicatorState();
}

class _CustomFadingIndicatorState extends State<CustomFadingIndicator>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        microseconds: 700,
      ),
    );
    animation = Tween<double>(
      begin: 0.2,
      end: 0.8,
    ).animate(
      animationController,
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(
      reverse: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.childWidget,
    );
  }
}
