import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_sizes.dart';

class OptionalIcons extends StatelessWidget {
  final VoidCallback? onViewClick;
  final VoidCallback? onEditClick;
  const OptionalIcons({
    super.key,
    required this.onViewClick,
    required this.onEditClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        onViewClick != null
            ? CustomIconButton(
                icon: FontAwesomeIcons.eye,
                onPressed: onViewClick,
              )
            : SizedBox(),
        AppSizes.width4,
        onEditClick != null
            ? CustomIconButton(
                onPressed: onEditClick,
                icon: FontAwesomeIcons.pencil,
              )
            : SizedBox(),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: AppSizes.radius18,
        child: Builder(
          builder: (context) {
            return Icon(icon, size: AppSizes.size16);
          },
        ),
      ),
    );
  }
}
