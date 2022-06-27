import 'package:flutter/material.dart';

import '../../../../shared/components/toggle_icon_button/toggle_icon_button.dart';

class LikedButton extends StatelessWidget {
  const LikedButton(
    this.isLiked, {
    super.key,
  });

  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return ToggleIconButton(
      inactiveIcon: const Icon(Icons.favorite_border),
      activeIcon: const Icon(Icons.favorite),
      isActive: isLiked,
    );
  }
}
