import 'package:flutter/material.dart';
import 'package:simple_live_app/app/app_style.dart';

class ShadowCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final Function()? onTap;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  
  const ShadowCard({
    required this.child,
    this.radius = 16.0,
    this.onTap,
    this.color,
    this.margin,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: margin ?? const EdgeInsets.all(4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.antiAlias,
      color: color ?? theme.cardColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: theme.brightness == Brightness.light 
              ? AppStyle.lightShadow
              : null,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
